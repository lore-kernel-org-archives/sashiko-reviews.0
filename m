Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411161;
	b=fzUGAzoZ8IQG1HagpAroLfV6YRlGA7nvdsUvlq0N0ZcJJ/hicyL1Man9gUUutNDoHX6l
	 S9MVPZ28TOGhr7wM8Zr1VIU4fIfOLsktwFfiXFbSvQ2Iow8osLvhU64ugiZhG5EdWIirT
	 /RaXJciztFxevZXlTBIemkQSxTUALcC3vhLcNhetjTydiE0SvgRumd8xfY+v0a/Eddsmw
	 ajTim3VRR9vRmTP8PtXUvW0ng6gDYMF2NWU9XQw4bZkFoDed2WHbiRJqvjrJ7Ze2WGwVP
	 OAe0rFX6wPu4jzf4pmLTj3y9FGv37ViROaifWzGWMmvG6bgsZJB4ac/Gb6GdOsKR29A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PgP1qIz2w/OR/xuvf7y5aFs0i8Rdt5F7Eb+3pqImopk=;
	b=Yc1Yw8rbLkUZrSR88SFsYB8Ekx/Ciir24dIwPgg5+rpw0kvRg6KIInMHUgk7WaIzj8nC
	 NxzHTJgR0gaWtYpQ2lsuxFbmJAJf/E7KsWNmUNkz3nj1hysMqZfUTyxxK4QLGL9QWoXbd
	 riEWaYW4uCuv5pod2P8kX+4bhAp4gyTjUpe2icmoRY4113d16NJaAmDbDJ69eEooiH+Ep
	 Q9YPmgwmzFlcDyYofpN9FgRCUn+iqJaUZ5i0WWnSYLd/Sg8mZ6vC1i1b+9EUnqFNHL3IR
	 qIEwwnHgk8JTDTeyVca5VcUvprlAvFf9i2mj5VWG9Nj7ZmDEvpmKR7iL0oU9GDDletA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CJcEmX2q;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671FE606A32D
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 15:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 671FE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CJcEmX2q
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so37041645e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 07:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794411159; x=1795015959; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PgP1qIz2w/OR/xuvf7y5aFs0i8Rdt5F7Eb+3pqImopk=;
        b=CJcEmX2q+lUnjjs7YH/SUU/rum2yNhnbmYQqiE39Ucaj/3BSEB80Zchl5cgr/H6OMK
         dKVr9MALtCo/9SUhwfMAWyYB9oX5iveHYUlNHguqiV4Bi17TgSxjNNkz9/xiif7Vw8HU
         sAWGyGzAl1HGL96flg8epB1BMDoleksjY9unA8dFOc94SO1RE+vThhsBMYaU9iFtcPPP
         D4hHyRkFj7Y9skQdymecdOrgi8ePJEZJr5r2j/RRA6twEN3fRv7MmevOvZY3vyM1U/uo
         Bk/gh0RJGnHk5uKv1tRSDJ7PUzuLHi19NRnOu6it/pjN8r2m6+HP4NR/8oGJCjknR5Oz
         LelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411159; x=1795015959;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgP1qIz2w/OR/xuvf7y5aFs0i8Rdt5F7Eb+3pqImopk=;
        b=U0ryPKfdx7vNsw8BK+kluGWcLz3GFcse2RmQxqOG0lhIvXmeHFWxPayqi5SLnvlS5m
         V+2bqQSWoePMJ0nyjlOeaTjIPQ0Q2fQX2HY3C33rlVSDnznIn1xrk9NTDVB9DWrWiO+w
         FqkjZFBfRYRwHr7FbasHi7iAwIQYxa3A4fNXuR6HOIlz9CLVSKKzQFlS7ENOPKSmCwg9
         JhJ1m7wipuRP6JrFG/qrXFziRyT0XTFy4wfVvsaRhWo1hMGIeXM6np9xaAQtn/ksEBPA
         jOFqF6XWJI7U1OugDGuUvIplVPJkU4eDrYeWi9l/Vdq/Jj3ZhFOkRHb6ewrcEO94JYz2
         VsMw==
X-Gm-Message-State: APuU4Z+rJ6R/jM0hVOODFSnUdOThiYEwywe/no75PIYld84QCrClgrpt
	BTQEWUTwvUXDxIT2Niesl3HY8URpeKnW/P+AOCWDcfqUEbVpJQV7HtYrOH8YqDenUeWfEP7E10O
	uEG25Sho=
X-Gm-Gg: AYBFou0YrwX7ejVlmf1QNp2DeJAFpRBsBNhEovJUxq5wEuQCJwA1MEkcyn7jwDF9i0N
	f2myGfjxbDaYVJlhnnHyECz/j3z45wHH4OaExVsY+7+YeMYJ75zPJONFjSLtkI9mDRrtzLqHc1v
	tQpxaioGKTRnnQ8aDrLWCyLJTq4vVskynCV2k9sdHS8sevKpQ2VcLjyxnJRpHq0AIixbybH+WzI
	JqYAY8N0gGmAqn2eG9ymY/m4i7Ihs6xOYyU/um7vhX5djsemZ6kH/m44wazZ5NX6vQdXwTO8lby
	/fAYRXJvD36NK011jgPLOAG24+r+YdFHiru6b0q2z95D7pNlI6MDqVjBPVunyVvSwu8CjeM9Tcb
	7ow6iDoV4fXxUfUxxyiZJEe/CZSKraocyzV2sKNS80hxc056hsHBmTq3OBKBjYj8AkK7ru5KgbZ
	KBG4uigcTNc2IC7BuULQQQdnR1Of1LkbjcQ5pK3LiD/PhFBRTvHsSL3J+cbMaBKi5DKIU3gZ3Qm
	OcXbWw8tOqgbHeKnQ00fzyHcgdazP+F5eRw/TXQK4Td7fzyVk+zuDaPIeW8Vp0dGjCi4lSxSlOo
	W8foGlq6KlBPBKXWuTWs1qO5dVgG874K
X-Received: by 2002:a05:600c:c11c:b0:4ba:4395:5755 with SMTP id 5b1f17b1804b1-4ba439563abmr31167145e9.5.1794411158644;
        Wed, 11 Nov 2026 07:32:38 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c53bb94sm3822685e9.8.2026.11.11.07.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:32:38 -0800 (PST)
Date: Wed, 11 Nov 2026 16:32:36 +0100
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev
Subject: Re: [PATCH v6 08/16] printk: Ensure consistent name and devname when
 updating preferred console
Message-ID: <avSKlPchC04gjpky@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-9-pmladek@suse.com>
 <sashiko-outbox-201951@kernel.org>
 <avHTsnRan9cALOEu@pathway.suse.cz>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avHTsnRan9cALOEu@pathway.suse.cz>

On Mon 2026-11-09 15:07:46, Petr Mladek wrote:
> On Fri 2026-11-06 17:37:13, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [Low] printk: cross-type update corrupts entry in
> >   add_or_update_preferred_console()
> > --
> > 
> > commit dac2f22b5af57f05f13a7369b2af922602449749
> > Author: Petr Mladek <pmladek@suse.com>
> > 
> > printk: Ensure consistent name and devname when updating preferred console
> > 
> > This commit adds validation in add_or_update_preferred_console() to check
> > that existing preferred console entries match the provided devname or
> > name and index when updated.
> > 
> > > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > > index 26fab79c32c4b..ba644a0650910 100644
> > > --- a/kernel/printk/printk.c
> > > +++ b/kernel/printk/printk.c
> > > @@ -2564,6 +2564,8 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
> > >   *
> > >   *   2. Either @name and valid @idx OR @devname and @idx=-1 are allowed. [*]
> > >   *
> > > + *   3. Only matching entries can be updated.
> > > + *
> > >   *  [*] A valid @name and @idx will get assigned for a devname later when
> > >   *	@devname matches during the device initialization, see
> > >   *	match_devname_and_update_preferred_console().
> > > @@ -2589,10 +2591,7 @@ static int add_or_update_preferred_console(unsigned int i,
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > -	if (!pc->name[0] && !pc->devname[0])
> > > -		is_new_entry = true;
> > > -
> > > -	if (is_new_entry && devname) {
> > > +	if (devname) {
> > >  		/*
> > >  		 * A valid console name and index will get assigned when
> > >  		 * a matching device gets registered.
> > > @@ -2608,11 +2607,18 @@ static int add_or_update_preferred_console(unsigned int i,
> > >  			return -EINVAL;
> > >  		}
> > >  
> > > -		strscpy(pc->devname, devname);
> > > -		pc->index = idx;
> > > +		if (!pc->devname[0]) {
> > > +			is_new_entry = true;
> > > +			strscpy(pc->devname, devname);
> > > +			pc->index = idx;
> > > +		} else if (strcmp(pc->devname, devname) != 0) {
> > > +			pr_err("Updating a preferred console with an invalid devname: %s vs. %s\n",
> > > +			       pc->devname, devname);
> > > +			return -EINVAL;
> > > +		}
> > >  	}
> > >  
> > > -	if (is_new_entry && name) {
> > > +	if (name) {
> > >  		/* A console name must be defined with a valid index. */
> > >  		if (idx < 0) {
> > >  			pr_err("Adding a preferred console with an invalid index: %s, %d\n",
> > > @@ -2620,8 +2626,15 @@ static int add_or_update_preferred_console(unsigned int i,
> > >  			return -EINVAL;
> > >  		}
> > >  
> > > -		strscpy(pc->name, name);
> > > -		pc->index = idx;
> > > +		if (!pc->name[0]) {
> > > +			is_new_entry = true;
> > > +			strscpy(pc->name, name);
> > > +			pc->index = idx;
> > > +		} else if (strcmp(pc->name, name) != 0 || pc->index != idx) {
> > > +			pr_err("Updating a preferred console with an invalid name or index: %s%d vs. %s%d\n",
> > > +			       pc->name, pc->index, name, idx);
> > > +			return -EINVAL;
> > > +		}
> > >  	}
> > 
> > [Severity: Low]
> > As reported by Chris Down on v5 [1], does replacing the combined
> > (!pc->name[0] && !pc->devname[0]) check with separate !pc->devname[0] and
> > !pc->name[0] checks allow a cross-type update on an occupied slot to
> > corrupt the entry instead of returning -EINVAL?
> > 
> > If preferred_consoles[i] was added by name (so pc->name[0] is set and
> > pc->devname[0] is empty) and add_or_update_preferred_console() is called
> > on that slot with a devname, !pc->devname[0] is true.  It treats the
> > existing entry as new, sets pc->index to -1 while pc->name remains set,
> > and overwrites pc->options and braille options.  The reverse also happens
> > when a name update hits an unresolved devname entry where !pc->name[0] is
> > still true.
> > 
> > Keeping is_new_entry = (!pc->name[0] && !pc->devname[0]) and checking
> > if (is_new_entry) before the strcmp() branches would reject both
> > mismatched updates with -EINVAL.
> > 
> > [1] https://lore.kernel.org/r/auLxQDWkHLV01D1t@chrisdown.name
> 
> This problem currently does not exist because there is only one
> caller in __add_preferred_console(). And it calls this function
> only when "name+idx" or "devname" matched. And only "name+idx"
> or "devname" could be defined.
> 
> Well, this patch is supposed to add paranoid checks to make sure
> that it is called correctly. So, we should catch these cross-update.
> I would add two more checks:
> 
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2606,6 +2606,11 @@ static int add_or_update_preferred_console(unsigned int i,
>  			       devname, idx);
>  			return -EINVAL;
>  		}
> +		if (pc->name[0]) {
> +			pr_err("Updating a preferred console via devname when name is already assigned: %s, %d for %s%d\n",
> +			       devname, idx, pc->name, pc->index);

I thought more about it and this check looks to strict.
It might make sense to update the preferred_consoles[] entry
even when it was already used to register a console. For example,
someone might want to unregister the console and register it again
with another options.

> +			return -EINVAL;
> +		}
>  
>  		if (!pc->devname[0]) {
>  			is_new_entry = true;
> @@ -2625,6 +2630,15 @@ static int add_or_update_preferred_console(unsigned int i,
>  			       name, idx);
>  			return -EINVAL;
>  		}
> +		/*
> +		 * The name should get assinged when matching the devname, see
> +		 * match_devname_and_update_preferred_console().
> +		 */
> +		if (pc->devname[0]) {
> +			pr_err("Updating a preferred console via name when it was preferred via devname: %s%d for %s, %d\n",
> +			       name, idx, pc->devname, pc->index);
> +			return -EINVAL;

Same here.

> +		}
>  
>  		if (!pc->name[0]) {
>  			is_new_entry = true;

I am going to keep the check whether it is a new entry separate.
I mean the check:

	if (!pc->name[0] && !pc->devname[0])
		is_new_entry = true;

Sashiko should stop complaining that we miss cross-updates.
It seems that it even makes the code more straightforward.

Best Regards,
Petr
