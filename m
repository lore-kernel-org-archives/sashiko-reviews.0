Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238892;
	b=LZLa/1GwsP2PFgGkBWxMI8iMLJJ1QdaBqVpWZtVqfKmyaUzr8WF9zwcKDjX1XDuWCdTT
	 ybAakdv11xYPlEtWjiZZmVK7EHWWkl+ofD/+bkao4fdmEAda++2C9rtVARsEhwAear9G7
	 P7+JQ7Ge8KNbH1cyyIh+VtKhZoyZNq0m2pmiyMZBgDxkSEV3xvz1ZCq5amZy4NPSV4JXd
	 5wfd0KS2YOV6f2GlauO9N76Dud/f64c/grUBdw7/aFYK/AXVMk6gBxIm0CsGY+XqVw6z0
	 u3gmosPSb1zSH5tgy9cK1pI12MtGVBCVMJ5Q6kpUA6ZVUH3z7GIDJ5snIDZRd2+Alng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=IpremIRTkTVFOAJN8j3i3/tFGcO5s568XdtEcWHXTOQ=;
	b=pZu13CJtytHx3i7VmeREGFnrxXiEWFo3DQ/W3NnDvUWD9jcX31LrDLU2mvLYABMkRJD0
	 AeLHpXV6KRVWF72QRvMDhqKwK49GV6gCeU9buSy/g/IXYpfvxVI/9j/GP/GA9Oqk7kuKA
	 Hv4msV8rZ+UGg68CSVcDAOXxZG3OvRMvjB1K8kClVPpaS3XPllbKtAxG3SIq0vNJCe55I
	 GSWtZx8rqDQR/crtKtITZMAFVXwnUM9+dwOy+HOGG48cxnZFcqgLcRO+HhWoJUitf8kDP
	 R6GgS1iBK1c56zPNlKacGZlKGV+HQ0irMtAmRVB0AC5TE9QXuKWhkQyU6h2S3/wNEkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MNWZ5Wkv;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759DD606A32A
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 15:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 759DD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MNWZ5Wkv
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso6997485e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 07:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794238891; x=1794843691; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IpremIRTkTVFOAJN8j3i3/tFGcO5s568XdtEcWHXTOQ=;
        b=MNWZ5WkvABjNm+5qzJ6DXZxoMCsK88MHgYEr4MOtYIVTBKP+6qHBAmMAj2nzrbON2v
         tuEwcrkWIV+ZjiLpoGmafR7alxDYOfk5Z7MUWerfuAJ5i34i5gZXK6C8ta8jnpJxCpUl
         5EbjkhQsbrw7KjGYxhLK9m7q8DRiVde5ZOB+K9pGAhHcOo6mM3ND8mlf4kzw3okfC28i
         W4+/NZbWmjutCxvi9T5qBqFm3L6/GTTIlewSpqDOu+sjiIBai666j6rXR4GE+Km/2sd1
         7N3/9BHxj6BtG9B/arYKZBU9chU9q2fJl5JSHMzEhgAVE9J+xR1C+lps84+tq0Ykqon9
         qd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238891; x=1794843691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpremIRTkTVFOAJN8j3i3/tFGcO5s568XdtEcWHXTOQ=;
        b=IMYi6frrg8gmILsF+DnlSYNnfCg6j9RXePev6XwMEoISK1iB0Wc5Qep1AKSAqLJRXc
         VtcUvcrVdW/gNgrHbmGfP+O74mSLGMmDUw8z+MBX9mnGjGTHCzzODO/TOSl4sEPPeIhd
         5HD7bCGaq4Cd9/d7sdFiw0U72dSURg+aTNQJQLrszo2qvY9YrC1/ySAgvnXzbaTwWH+I
         3O+STxUFlYy2nbtbA4mT7YfKx61wAG2PoXfwVhtqU/mbCo/fyDzqhYxBJZ6GsSgDIWDy
         INQDIAIrWAdGQdPSjwxwFKF7JzjR61LCndm7p3dZg20bb2Wdys5CBsnhLh7COhf3F184
         cwEg==
X-Gm-Message-State: APuU4Z88apxslabP3gcR+Sg4BlFDiE9DtpmQ8HonhvxrMnS7fdE1+k9p
	8aMvFr8PF45+kA5bx+xob7FOFns3XV6G2wi3vkhMObrZ3AxB4ljqebJk2PoSCuoHIxaJC61BS/F
	EUvCUcjg=
X-Gm-Gg: AYBFou2BD2tnsF9Huab0ZYRzjsukthcf4GvyZUQDPrIIYzXCopIa4msSAxqCzztN0OL
	Pz/qT4KiEmh5zrrMdJTDGDIolZbyEH0AGoH7kgDhXL4EwNI9nq/ll1883+ZukJbRVJMm7oxK3xA
	u/fd1LCV5NCdBmdrQng1Vi/DNsQmBMunVOOZK1E0oQxsnnb6d/F6OsQwvIzDS0KsOnVtTTL9d7L
	bqarqWRKA6Otq4tRiXij5+M6Wn7oUPNfPFGiqp7yJdb78ZQ3b81SszA1NJXkmGcdbe8g36IvfUj
	OMw8HSfEMLKmKW9wbnbRo1PjtftL2Mz3/4fDAKxyoPqc+8zakmYHJFjeL02aHUfiBeqtV3wVa9D
	4N9Ajhjm32+dzWK2bTTL1XD19WjXgdSMX42eGWW36/HRhgewDlTf9CK+PWiP6HZGnWFYuupgpD/
	YI1OhJP6VsfZVia8c16GE94misDNqfmVsaYioY62decA2cbBJwy2SWRJidkPadV+lPm+zW2HuSR
	bkXZe6f4qk2pPE4YwrGE9d0eezfcX4Rv0zAG0FeoKfR/gBDsCh6xuxMIoVc01iLKjoIRur96XMu
	/vMQDdxXm7AuRfBxhWgIsyA2eGPYZw==
X-Received: by 2002:a05:600c:4f52:b0:4a1:dadf:9876 with SMTP id 5b1f17b1804b1-4b963c6e061mr99726635e9.23.1794238890834;
        Mon, 09 Nov 2026 07:41:30 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cb75913sm181306315e9.0.2026.11.09.07.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:30 -0800 (PST)
Date: Mon, 9 Nov 2026 16:41:28 +0100
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	printk@lists.linux.dev
Subject: Re: [PATCH v6 16/16] printk: Try enable preferred consoles only when
 there are any
Message-ID: <avHpqFG7qYOKRUMf@pathway.suse.cz>
References: <20261106171952.207909-1-pmladek@suse.com>
 <20261106171952.207909-17-pmladek@suse.com>
 <sashiko-outbox-201948@kernel.org>
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
In-Reply-To: <sashiko-outbox-201948@kernel.org>

On Fri 2026-11-06 17:35:38, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] printk: try_enable_console() skips preferred console updated
>   with brl
> --
> 
> commit 72647c5e02d15452d74306497aa4961e3c65fa1a
> Author: Petr Mladek <pmladek@suse.com>
> 
> printk: Try enable preferred consoles only when there are any
> 
> This commit moves the try_enable_preferred_console() calls into the else
> branch of the list_empty(&preferred_dev_console) check in
> try_enable_console().
> 
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index bbef405141573..a45a6fae91669 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -4103,7 +4103,7 @@ static int try_enable_default_console(struct console *newcon)
> >  
> >  static int try_enable_console(struct console *newcon)
> >  {
> > -	int err;
> > +	int err = -ENOENT;
> >  
> >  	/*
> >  	 * First, try to enable the console driver as a Braille console.
> > @@ -4142,16 +4142,24 @@ static int try_enable_console(struct console *newcon)
> >  			if (err != -ENOENT)
> >  				return err;
> >  		}
> > -	}
> > +	} else {
> > +		/* See if this console matches one we selected on the command line */
> > +		err = try_enable_preferred_console(newcon, true);
> > +		if (err != -ENOENT)
> > +			return err;
> >  
> > -	/* See if this console matches one we selected on the command line */
> > -	err = try_enable_preferred_console(newcon, true);
> > -	if (err != -ENOENT)
> > -		return err;
> > +		/* If not, try to match against the platform default(s) */
> > +		err = try_enable_preferred_console(newcon, false);
> > +		if (err != -ENOENT)
> > +			return err;
> > +	}
> 
> [Severity: Medium]
> Can this skip a preferred console if the command line specifies the same
> console first without Braille options and then again with them (for
> example, console=ttyS1,115200 console=brl,ttyS1,115200)?
> 
> When __add_preferred_console() matches an existing entry, it calls
> add_or_update_preferred_console() with is_new_entry set to false:
> 
> kernel/printk/printk.c:add_or_update_preferred_console() {
>     ...
> 	if (is_new_entry) {
> 		pc->options = options;
> 		braille_set_options(pc, brl_options);
> 	}
>     ...
> 	if (brl_options) {
> 		want_braille_console = true;
> 		list_del_init(&pc->preferred_dev_node);
> 	} else if (!is_braille_console_preferred(pc)) {
> 		list_move(&pc->preferred_dev_node, &preferred_dev_console);
> 	}
> }
> 
> Because braille_set_options() is only called when is_new_entry is true,
> pc->brl_options remains NULL and try_enable_braille_console() ignores the
> entry.  At the same time, the if (brl_options) branch unlinks
> pc->preferred_dev_node from preferred_dev_console.  If no other
> non-Braille console is preferred, preferred_dev_console is now empty, so
> this regression prevents try_enable_preferred_console() from running and
> leaves the console either disabled (if another default console registers
> first) or enabled with default index 0 and NULL options via
> try_enable_default_console().

This is the same problem as in the 14th patch. My proposal is fix it
by a separate patch which would always update pc->brl_options when
they were not set before, see
https://lore.kernel.org/all/avHpL7ojyapVvGlY@pathway.suse.cz/

Best Regards,
Petr
