Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230961;
	b=RQvg/LX/26Xeq9x9z62CpqbxzmVAt2VAL0UWMKUbz+epNXejBjBHsOyoGVmqvXH8jKbz
	 ltCCleWyoQkbcMpIQgpHgy0n6zXFHEu3s+WxSh6bJYWy+fiPcvGTByNm9Ad4TIjh5/aCe
	 z1RCPPIHvDpk4TEtGTP0Xv6YGFWm64hNadwjuonwukdKDvb1Yg7i9MJ3ZPC4eHbweSj7B
	 Tt5OcoqIVTASgbNjkTFKyujBnOe6sWtl2H9LPjgHl4Zu4e2Q4s6w8tonaWBQv0JaT9/yr
	 jRso55lYZftRgv/3LzpFQ70IvwCxQWezCy3M6/x5VNIJFl+YqGV4MbCP+gJToV2GsdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=p8KeZQ1gDNMPi4Q0Vpjy/FG6SeCgCptXYJ2kECeS9lk=;
	b=cc5gXCQ36HRzuaQ+TeTLydgW+x6Ta8+ldUGs4ahgtskUhYADDrMAnnLfRljn9ev1ToZ1
	 CY3PoYW2X3z+7hdq/ochfMQHdvrEHmdvIUbovamT7d4Uxp5twFnbby68AB7cqsXRVScNO
	 miLhainYj0xILL9Ji/Ld0iddkTZU7wqqvZUxzH/6kckXW+u+KiHh/qgKena0TTHO/KbZL
	 Gvud+mLKIPDYPzt4mqovpprKvReDxAGu4nYi8IeaP0SKxa8eg8tGVBV3B47/NEdOuIE7l
	 +3DuybjZ5s5Mz5NHaZ7uj7kK1zG/BeEgRCjXkoIarQqBmPidiSOZRoRSk9XH5shK2eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=V9TQhlQy;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DFF606A322
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 13:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66DFF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=V9TQhlQy
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so7151715e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 05:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794230959; x=1794835759; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8KeZQ1gDNMPi4Q0Vpjy/FG6SeCgCptXYJ2kECeS9lk=;
        b=V9TQhlQyfTKWphXcorF5a6gXcL5MBWQrGz0bHsUpFgragi5NnZlvU2cMTweH3ZDl/g
         X1V+Prw7MAtIHE5rDZVgKdyUWTLRNoK27e++VQFTPFfRaI7Sv+Ut0vk1Z/PWyblGhr70
         q+oDSBS1Tnh7t9oCPTUAKUXtc2QlsDdxaTQZI8RuxPXpf6NW+UAqw0SkoM46nJLuvYOk
         hWhTj/72DQt9p0G5oSgUo3GQWU5Vz7XViwju41KO8ms2NYVVi0EP0wANXlPaLGD13kcu
         3P5njhVXKnkoXOcOOpe+dgJkdzlDxvMU+EGh0x2h0uliwPY0iFpvmt/0zvAJE2IqhLaI
         pFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230959; x=1794835759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8KeZQ1gDNMPi4Q0Vpjy/FG6SeCgCptXYJ2kECeS9lk=;
        b=h9ebFOZIxCF4dfQKw92iCEG9XGycRj3Rl0iiTg/GZ5dmDKu1VLs00GAZh3bzbk4r6e
         F5WXQJL9yb/7MM72Py3ix3oDtXBapaQAPBIGFunwRerYvpRbyZ4hIhidIMhRV3yfhL3v
         bAgdscnLMa3ZZwYos3x2xwdGopKP1S4eeGUG/DO6e3MenjsxmdbUwT1MDcY9LlPlrKVH
         wv4Vf+xeTMTVKrg4zHgeSEkMJozQyCVUxArts133sK2Pq1mcwqxfXe4jqtaGzOr5uu9t
         jIio6OXYYxgK8hJMRZmRVXGCHnmtU6EyuZJXW94Zb//U/O/2/US1gu1ldYqaNDh3tALa
         s2/g==
X-Gm-Message-State: APuU4Z/0HqA4Ckk9Nb7oTlQWJVUa2UW/3IR/5zSkKRavKySL85TKL4zZ
	pfTpqY+Hed+AbsOyFZiJK9ZDFGUepFP5F/ZIHIeyKzQYzJu1vRvr8cBw7xgvRnItg1R9qKz1JH0
	w6AQU16A=
X-Gm-Gg: AYBFou2TaMARZls7jCAws/4E2U8hRfkFahdiN+ZpwD7xb1Mg/Uv3LD62RbXovA6/w7X
	9ht5W0wBLzAuj/nCIK4qXvQ7X2ZbMr4NB6qx1BVuH9356KApjoVrtR/NKxK4MIhegH8ehEvdgKX
	ESdZPwafFtn50ZOReRCDsW9MiVMlUpkFo0Klnx22z6sZojn/sDfyd5UmyGRwdFne3ai6/kpjD24
	S/KqNDTNjfI8DKtfrOkSQu9h54fcKaCqiEvAiBy3c1T38ngD8oD76YI+fntrlLJGqoyV0PrGzXb
	iiv5x+JYjNceRwac2STx+o/Ytv/DVoSaFAjtonOAUA7uYuGzZ2FOpq/RUiYqxdRm/9sz0ZLQepO
	TZ2Zh/Y10XXXCLnMEBB3AoLYGBDdYsSsEsGGqgUsu3ewplFEY81odflgj5PC5Zsgkqi6/aBo/wq
	kVvGIvSch2q84AJ4QGHtGTH2vONBQXVGP14YRjW7q3SF5a/ktvI6vgkg2VxAImi13cU8wybWiSR
	YiRZt/AstL3CUU/CRnNeHyNP4qARBu9wPpWBXKo/cPmfISRLOl2uU9pgv0jkFYzbl+QvPjEiFbx
	pM4nBR2U/DXKCRCxJN/79plbEJnhig==
X-Received: by 2002:a05:600c:46d2:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4b963c814c8mr73950475e9.14.1794230958732;
        Mon, 09 Nov 2026 05:29:18 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm244819165e9.13.2026.11.09.05.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:29:18 -0800 (PST)
Date: Mon, 9 Nov 2026 14:29:16 +0100
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev
Subject: Re: [PATCH v6 04/16] printk: Separate code for adding/updating
 preferred console metadata
Message-ID: <avHKrPxxBDIuHUBd@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-5-pmladek@suse.com>
 <sashiko-outbox-201935@kernel.org>
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
In-Reply-To: <sashiko-outbox-201935@kernel.org>

On Fri 2026-11-06 17:30:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] printk: malformed kernel-doc comment for
>   add_or_update_preferred_console()
> --
> 
> commit 53283e23ffd138683d26af82f710d22a050dc49e
> Author: Petr Mladek <pmladek@suse.com>
> 
> printk: Separate code for adding/updating preferred console metadata
> 
> This commit splits the logic for adding or updating a preferred console
> entry out of __add_preferred_console() into a new helper function,
> add_or_update_preferred_console().
> 
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 27bf77a777a2e..24bb6f63c070a 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> [ ... ]
> > @@ -2543,26 +2544,34 @@ asmlinkage __visible void early_printk(const char *fmt, ...)
> >  }
> >  #endif
> >  
> > -static void set_user_specified(struct preferred_console *pc, bool user_specified)
> > +/** add_or_update_preferred_console - Add or update a given entry in
> > + *	the preferred_consoles[] array.
> > + *
> > + * @i: index of the entry in @preferred_consoles table which should get updated.
> > + * @name: The name of the preferred console driver.
> > + * @idx: Preferred console index, e.g. port number.
> > + * @devname: The name of the preferred physical device.
> > + * @options: Options used when setting up the console driver.
> > + * @brl_options: Options used when setting up the console driver
> > + *	as a braille console.
> > + * @user_specified: True if preferred via the kernel command line.
> > + *
> > + * The function adds or updates an entry in preferred_consoles[] array. Also
> > + * it updates some global variables which are used to make the right decisions
> > + * in register_console().
> > + */
> > +static int add_or_update_preferred_console(unsigned int i,
> 
> [Severity: Low]
> As reported by Chris Down on v5 [1], scripts/kernel-doc requires the opening
> /** marker to be on its own line, so placing the function identifier on that
> first line causes the parser to skip this kernel-doc block, and it is also
> missing a Return: section.
> 
> [1] https://lore.kernel.org/r/auLwTYSza9exX3ba@chrisdown.name

Ah, I misunderstood the probem. I added an empty space after the
title. But it wants to have "/**" on a separate line.

Will fix in v7 or when committing.

Best Regards,
Petr

