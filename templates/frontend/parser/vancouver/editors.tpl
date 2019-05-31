{**
 * plugins/themes/tocoTheme/templates/frontend/parser/vancouver/editors.tpl
 *
 * Copyright (c) 2018 Universidad de Pinar del Rio
 * Distributed under the GNU GPL v3.
 *
 * @brief for writing names of authors or collab group
 *}

{foreach from=$reference->getEditors() key=i item=name}
    {if get_class($name) == "JATSParser\Back\Collaboration"}
        {assign var=collabName value=$name->getName()}
        {if $collabName != NULL && $i+1 < $reference->getEditors()|@count}
            {$collabName},
        {elseif $collabName != NULL && $i+1 == $reference->getEditors()|@count}
            {$collabName}.
        {/if}
    {elseif get_class($name) == "JATSParser\Back\Individual"}
        {if $name->getSurname() != NULL}
            {$name->getSurname()}
        {/if}

        {assign var=givenNames value=$name->getGivenNames()}
        {if $givenNames != NULL && $i+1 < $reference->getEditors()|@count}
            {$givenNames},
        {elseif $givenNames != NULL && $i+1 == $reference->getEditors()|@count}
            {$givenNames},
            {if $reference->getEditors()|@count == 1}
                ed.
            {else}
                eds.
            {/if}
        {/if}
    {/if}
{/foreach}
