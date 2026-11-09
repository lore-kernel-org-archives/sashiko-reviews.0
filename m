Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238184;
	b=3qoXlvi4Yz4zuDiR/0zqmElJV0uILFzqZ1uKLxjhn/70nluuXH1Y5fLTEMMaBZFX7LvB
	 nvZNYSPOvE2c/Mbu+R/Hv7Spm9PjWqhHXaBAUgshhDzUG6EoCyxdV9UBXbag601j2rtej
	 LjHyIsUO2PQKRs8v7pMl6cIJISLdyAV2D6faPIeGK8V8YjGfTOvVdSGoH/CYNKBql+VJE
	 xGa39/Oim5l+3iTjQubhvsfOwEqqSOFfk+2sz17JvlFCkPjQEw5XK3GzePVH4UVxm5hiW
	 OHAueihRObjHjxjN/kfosHavNU6UdA+I1rXJz70SwxL8DJzzJIkqydl1GVqK3CqhVfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=tH1jMVDTbLHgXX9uncHB3H+dPepNsist1MAiY4eBEFo=;
	b=k/ISVUCgc39RW7jA5VJHMOy1YlUp2VUdnzjCbNsC2pA3r1ERxKBgy7oARZOYrmlFVZBg
	 2+jaB8vdY66zZm6PyH6R38GCaSJuyAqRPJY2yQBBqChbqkI1OdTfi8K7YX/GyRiUyDZGI
	 Pdhe14Waud8dalULZm8gv6//W5lv6MH16AaG5LKH2AxJ5FhE6x8I3UVofDJ3qIM/X3IIB
	 a/oWC6hYTuBJ8o9qdorLEXE9SRTonzWo64IiIBz5a4JoS8sSk57CE3IpNQOlT4g/qNt1+
	 MID4b/hJ+8lUAd9mtdcOTDiLaQuZZssscWchG2dgOxy4nYalxwnMMYbA47o8tQM0cFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YQJn1wYW;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23877606A331
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 15:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23877606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YQJn1wYW
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so8007355e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 07:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794238182; x=1794842982; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tH1jMVDTbLHgXX9uncHB3H+dPepNsist1MAiY4eBEFo=;
        b=YQJn1wYW9cSHR/ciVngQen51DHsvjPODkopVtH9ToVOmgo4UPxYMqCAq2D9NoFSjMc
         T9XoXQvwd2yXVWTJTrt8hlgtxe+J7ywmhI2/egk5uyO00jmo/jtom/oHw7UQem0w5FSL
         AIWzqRdkXvC2AGWpW6ppc24l4jnVkuPb+Ccd77ZEa5lYPjga66ZuSdeGhNmp3ZyWGmqr
         9meHzJYrtNnKmC0S9GOZEvqhRPUJ2jnJ0IZJcRJsF0f3ErB1dhiTwt2JFKNfV50Yq2xe
         WOPXwbxHJsRHlA76DJtvhjrxh1WVOPL2if3NgfjxvcouelPlhbP5DBBe6wKY9vwBu5ZM
         SEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238182; x=1794842982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tH1jMVDTbLHgXX9uncHB3H+dPepNsist1MAiY4eBEFo=;
        b=Hm2zvSZd2dOOsTEGA45pVhLADDqIJpRaQ0cnn9ciV7jvUyYhdTFD2mjIjVWJGhYMLr
         +/WJVch07gt+uFYNiZ6+PZI/edgOIpVSaUv03ZKy+0g56/MeKaoYiWGpf9/dWcVqJKEB
         7304qtKLhFgCy+gsl9h/s2TA836BJz27omGcSRUSt5UtyeI0bW7iIaOmNmHNxjhzcHGB
         +ePa/6thPddHl7i/yJ/nlryKZ/imrLHtqIvFW87u/jGrfAxMIrOp7CDJqIqLfAz1GpjC
         NH/WpGkCM78n1PQpqS5lnX8ds8lSN0mkYFtSv5/gZc5OELs42+I66FU8bVKv5wDEksKr
         83Ow==
X-Gm-Message-State: APuU4Z+Zhy6f0JbiFDUEx4KY2Uv4zfQ4oBlc+vVWnz5GZ7O0pNurPlz6
	KtnQOehjuQZP0vdZcU3+s9sFx1W+3/od/vqBQ1fd3Jhi5/9N5+F0OwYj6nTc2o/PeYLrvaQu+GN
	DWegqqQ0=
X-Gm-Gg: AYBFou0bflTHI4wgQ3rgJjqlpKbO5M8hQiofiMgRxiFklKAO1Z/k0KACRF2d9I47qXB
	FciS7SQ5SGmyFOtnoQyjIaXHNUsvCblxNRX2xuc9R5PG31v6y8uURxhtqGat85aAVx1wnShf0jM
	Cy//Fer0aw7LRN+qtQNx6i4G0Zvt/qEY0WwK6aqoJ4x6raVf/p4HbOnFVztgGnZgqXwz3bwp3dW
	WNfJLxbvqELaG4xq1RQEI6MVY2Wr60XmdyVycDx3M8T1+/973oq5nbz+gKB8XqLvRRwhZJQnlRO
	BGwIZUl3BEALJUvPr9uR2NfvKKoucqSvAPu6iindOF+YiEz/oFJE9p6n85Nk04MPCIUBJQhQE3f
	wra+FamfDKDoFDK2UFodV69e0J7djWiPc7AuOtTwpwZ3r4OwINjoBFezu/dDVaGiV/VNBThYj8C
	3JxSTnKdWLbKyozPKIEmvWigm2ZGswB86aTRTjtyKrYsq7fb5qmyBBSaCN6+E+17ljgd8NbQpf0
	CTCh/z/DYocVUrE8JR8JQkrx5AA4T2PjHVS/F3BvBXmqIOY4fBw/BSlXTyAaKLUaBGa8GbOfilf
	UF+tRAxQ4s568KzqXzfAqx+P1xxaIg==
X-Received: by 2002:a05:600c:4eca:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4b94d7630d0mr80169055e9.2.1794238182334;
        Mon, 09 Nov 2026 07:29:42 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79501502asm166258865e9.2.2026.11.09.07.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:29:39 -0800 (PST)
Date: Mon, 9 Nov 2026 16:29:33 +0100
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev
Subject: Re: [PATCH v6 14/16] printk: Do not set Braille console as
 preferred_console
Message-ID: <avHm3aYaDdcif-ss@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-15-pmladek@suse.com>
 <sashiko-outbox-201949@kernel.org>
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
In-Reply-To: <sashiko-outbox-201949@kernel.org>

On Fri 2026-11-06 17:36:30, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] printk: inconsistent Braille state in
>   add_or_update_preferred_console()
> --
> 
> commit 7297fe2fd570a081c485097cb3f11fae0fc8a9d2
> Author: Petr Mladek <pmladek@suse.com>
> 
> printk: Do not set Braille console as preferred_console
> 
> This commit replaces the preferred_dev_console index with a linked list of
> non-Braille preferred consoles so that redefining an entry as a Braille
> console does not leave preferred_dev_console pointing to a Braille entry.
> 
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 1aad21c082c99..efc695ca9d13c 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> [ ... ]
> > @@ -2649,10 +2656,20 @@ static int add_or_update_preferred_console(unsigned int i,
> >  		braille_set_options(pc, brl_options);
> >  	}
> >  
> > -	if (brl_options)
> > +	if (is_new_entry)
> > +		INIT_LIST_HEAD(&pc->preferred_dev_node);
> > +
> > +	/*
> > +	 * The last preferred console should get associated with /dev/console.
> > +	 * Except for the Braille console which can't get associated with
> > +	 * /dev/console.
> > +	 */
> > +	if (brl_options) {
> >  		want_braille_console = true;
> > -	else
> > -		preferred_dev_console = i;
> > +		list_del_init(&pc->preferred_dev_node);
> > +	} else if (!is_braille_console_preferred(pc)) {
> > +		list_move(&pc->preferred_dev_node, &preferred_dev_console);
> > +	}
> 
> [Severity: Medium]
> When an existing non-Braille entry is updated with brl_options (for
> example, console=ttyS0 followed by console=brl,ttyS0), does this leave pc
> in an inconsistent state where preferred_dev_node is removed from
> preferred_dev_console while pc->brl_options remains NULL?
> 
> braille_set_options(pc, brl_options) is only called when is_new_entry is
> true, so is_braille_console_preferred(pc) still returns false after the
> update.

It is a regression since v5 because I removed the questional patch
for overriding console options, see
https://lore.kernel.org/all/20260929120546.328616-10-pmladek@suse.com/

> As a result, __try_enable_preferred_console() skips pc during the
> Braille pass and instead enables it as a normal console without
> CON_CONSDEV, and if it was the only preferred console, preferred_dev_console
> becomes empty and try_enable_console() also falls back to
> try_enable_default_console().

Note that the same problem existing even in the original code (before
this patchset). The original __add_preferred_console() did:

	/*
	 *	See if this tty is not yet registered, and
	 *	if we have a slot free.
	 */
	for (i = 0, c = console_cmdline;
	     i < MAX_CMDLINECONSOLES && (c->name[0] || c->devname[0]);
	     i++, c++) {
		if ((name && strcmp(c->name, name) == 0 && c->index == idx) ||
		    (devname && strcmp(c->devname, devname) == 0)) {
			if (!brl_options)
				preferred_console = i;
			set_user_specified(c, user_specified);
			return 0;
		}
	}

Note that it was inconsistent. A passed @brl_options prevented updating
"preferred_console" but they were not stored.

Note that the console_cmdline[i] entry is considered a Braille entry
only when .brl_options are set.

I would fix this inconsistency by a separate patch:

From 25b6c5669758152119720dec79338bf59fde9484 Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Mon, 9 Nov 2026 16:01:35 +0100
Subject: [PATCH] printk: Update Braille options when preferred more times

The current behavior is not consistent when the same console driver
is preferred several times as Braille or non-Braille console.

In particular, preferred_dev_console is not updated when @brl_options
are passed. But @brl_options are stored only it is a new entry in
preferred_consoles[].

It is even more hairy because preferred_console[] entry is considered
a Braille entry only when .brl->options are defined.

Make the behavior consistent and always update pc->brl_options when
@brl_options are passed and they were not defined yet.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index e248f2d0d01c..3892cf036498 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2665,10 +2665,10 @@ static int add_or_update_preferred_console(unsigned int i,
 	 * Historically, the preferred options are stored only by the first
 	 * caller who prefers the particular console.
 	 */
-	if (is_new_entry) {
+	if (is_new_entry)
 		pc->options = options;
+	else if (brl_options)
 		braille_set_options(pc, brl_options);
-	}
 
 	if (is_new_entry)
 		INIT_LIST_HEAD(&pc->preferred_dev_node);


I could add it into v7 or send separately as a followup fix.

Best Regards,
Petr

