Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454163F3289
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 18:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323205; cv=none; b=Brqhq7UX781LuBRkQxZ1ZDT6iGlHhpUEDrNTYbDjS9ZlxLhBFL9E4VVnYh+dgAOnCFXvPq4mbpln08yjZ/QXuf/S9/2+xEKcXf+OgLwzSqmdkiAB2UpL/zTwhFNe+Txe7V1Qb6cN66Q3R93NhuJKf+LAbjw07HRRgaL41sbfAwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323205; c=relaxed/simple;
	bh=Srl2h3jqmPGOnSHtcTPoQAzjqnGkdnU1hghJsct+GEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOpafcO1B/zEPX4t4DSp4H890YIa9RTnmbmKkmn+i+EDkgHbKHv8qU1EiiMI9n5y79Z49Xrcvz0dVy9C5nTP1pQWd7MsPnxckY/l6vlcTFwW4EyI4zydAhbzwrfa+h6dLM5OzKuAfymmVSMxaRpEkwNI7aEmhQrtHZkmYXDT7Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHmvO8Lz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHmvO8Lz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8911F000FF;
	Sun, 13 Sep 2026 18:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789323195;
	bh=+e7AJLZWuimJb9j3Pkmcdq0OaQqYF6XFACsj4HInuck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JHmvO8Lz/8vD89NRY1m8H2u6aR7+aeggP6az/1kzEw6xU64UeGYys9J+9NwjW6Jpw
	 h9cQOKkdD3YfwzVlEdhomLiH2txDWER52/cp19GaDvVfFswCkwi8VpRlPRMFuqiuJG
	 CWbiYWt5E/SdVL3QJbRLThP4F+fKDwBeUsRu0SM7LvY4X4vv7ved+nikgpyUBRjNDm
	 +Unsb01hmx0V60GdFJqyr6Q09Mol7BQpd/QRP8FvfpwG5ziZlh9UHQV4Ejykki/YAn
	 77d9N4i+YR0F/9m9zprd1ni88AIevz0PclnYkEL0cHvqHwgFQm6szPFSwYZ44ttc5p
	 o13qjs7cigp7Q==
Date: Sun, 13 Sep 2026 19:13:11 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Subject: Re: [PATCH 15/23] modpost: emit module descriptors as assembly
Message-ID: <aqbm06iwqg9ambra@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-15-5dc1ac01672d@kernel.org>
 <20260908211828.819701F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908211828.819701F00A3A@smtp.kernel.org>

On Tue, Sep 08, 2026 at 09:18:28PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] The hardcoded emission order of `__this_module` fields in assembly breaks when `CONFIG_RANDSTRUCT` is enabled, silently corrupting the `struct module` layout.
> --
>
> commit 36c35576d2135acc7ba00c67d37c3dbf0e909c0c
> Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> modpost: emit module descriptors as assembly
>
> This commit modifies modpost to emit module descriptors as assembly instead of
> C to improve build times.
>
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 0fd43c8a89ea0..550ccd753ed88 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> [ ... ]
> > +static void add_asm_this_module(struct buffer *buf, const struct module *mod,
> > +				const char *modname)
> > +{
> > +	struct this_module_field fields[THIS_MODULE_MAX_FIELDS];
> > +	const unsigned int nr_fields = get_this_module_fields(mod, fields);
> > +	unsigned int pos = 0, i;
> > +
> > +	buf_printf(buf, "\n\t.section .gnu.linkonce.this_module,\"aw\",%%progbits\n");
> > +	buf_printf(buf, "\t.balign %d\n", MOD_ALIGNOF_struct_module);
> > +	buf_printf(buf, "\t.globl __this_module\n");
> > +	buf_printf(buf, "\t.type __this_module, %%object\n");
> > +	buf_printf(buf, "\t.size __this_module, %d\n", MOD_SIZEOF_struct_module);
> > +	buf_printf(buf, "__this_module:\n");
> > +
> > +	asm_skip_to(buf, &pos, MOD_OFF_module_name);
> > +	buf_printf(buf, "\t.ascii \"%s\"\n", modname);
> > +	pos += strlen(modname);
> > +
> > +	for (i = 0; i < nr_fields; i++) {
> > +		asm_skip_to(buf, &pos, fields[i].offset);
> > +		buf_printf(buf, "\t" MOD_PTR_DIRECTIVE " %s\n", fields[i].value);
> > +		pos += MOD_SIZEOF_LONG;
> > +	}
> > +
> > +	asm_skip_to(buf, &pos, MOD_SIZEOF_struct_module);
> > +}
>
> [Severity: Critical]
> Will this hardcoded emission order of __this_module fields break when
> CONFIG_RANDSTRUCT is enabled?
>
> The logic in add_asm_this_module() assumes that the name field is located
> at a lower offset than any of the function pointers in the fields array.
> Under CONFIG_RANDSTRUCT, struct module is marked with __randomize_layout,
> which means the name field might be placed at a higher offset than the init
> or exit fields.
>
> Since the assembler cannot skip backwards, could this sequential assumption
> fail the offset-based .skip logic, placing the function pointers at incorrect
> offsets immediately following the name string, rather than at their proper
> offsets within the struct?

Yeah this was valid, updated to fix this by ordering by offset explicitly for
v2.

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org?part=15

--
Cheers, Lorenzo
