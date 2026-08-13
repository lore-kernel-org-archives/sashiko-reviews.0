Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C71472F73
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627551; cv=none; b=YwJyrbACQg4V+iqnGDNe3MkZyAUh6fZ+wz6wbklDG8sOrNypjLJ7Uam3dKAx9p5e9ZvOJ0rh4pvbozOsQya+D5rthfBh984wiOP/Oz4CHfddEHmLx3em+2KVND2sYnL+wKpQ+p72bTeYBHnGAb+Xf1O8dgDXpLHsGGRGxKwuWks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627551; c=relaxed/simple;
	bh=2BuxNkQYxYj9qq/cib0m9rPF3xFiXsKVNtyEBD4V7CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mboeCd6XVfo1RapZ7m3p6HLBSqMhhjyyWZK0HE7wdnLs5JC2AuriOZJtU8rBamtmgugiGPSeFwYDPGag0l77YS7EU58um8JhbNS7giGadxalFfXB7uIxpmg7U8z8cHxjCeAzV7bWpRRadY7SEbOcDAlNaeVbXxEHue8USebj4pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tlc/H8FR; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tlc/H8FR"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15b1da6b82so233303166b.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 06:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786627548; x=1787232348; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+H3sd2IVUaZuvvTHtvhvefhtE2d9rSylbl8r/c0+eUI=;
        b=Tlc/H8FRc+MjtFh5M/lApz95awIgXMaaKatLwG0PsAgWzbxNig9EB2MXJa81SDpWU3
         ZAV0CNU/TKVhaBSgmN3/furJvVrd+c9qYGkvXDrXKEmp5qfz45K0ybBPVHL7j1HjtQdQ
         vjDw+v0Qmd6nmheXAkzKWx/rUYcZHIqjpq2Pq7iDuunZ4Ax9OUVGms9puqca7yKBbi/b
         LL9VIMw4ErjBxt7/edb/24MpAF/ETAwgXGIonFab1ZIuKID4arQ0A+9druomza5tZCRn
         LM6MYRu2VucWRZq7UHISz6zOlyxbrRtyztLLSNYnufQRBtgiTPGhkGjk+7V3TohSooEz
         XcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786627548; x=1787232348;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+H3sd2IVUaZuvvTHtvhvefhtE2d9rSylbl8r/c0+eUI=;
        b=lzh3ZD+lb/FnHZJElgrAX6/fiuAdZAsMSwgBVR1ftz5zrXPDuJl2jqMbTzNCNuopWi
         rt2q8H9reVGE/XpNbRxYUpvSQJm9wGlNWxGyf6qLgceFLTEVw4fuXiY3ko/8O5MH4yq0
         s7BK+hvCyHxnw/ffArmLtn/jhRy1VsX/xPUxgRIv+qyFfLESn1t4vuDs8vj1HjzB1gxS
         oK06sIMoL+Jq51JJQ5PcvnU3mCpizlSebfPVQpDygnd3U+JnQkdPRzswplS7ds9XC97p
         hWeNH1Tg4Faw5nfdU96Vut/zl6naiQMFYe9ajOI/gD6fe0JFiJv21Ra9yn2Wpc7kdQQp
         GRHg==
X-Gm-Message-State: AOJu0YygY+HAC2jLelCik9/8IJAFrk21NZk7hx2c7nmCVJm/VIYt2zYf
	0QDG965ey7yk7W/e5PM8AiZl8I7FapH0I5qENITPt6HyucnDaR0M5k18SukM69xIecvNYyv0prC
	pJWJHSQ==
X-Gm-Gg: AR+sD10Wu9F1ryN1yyTZc8ISL3jGxWqrqHyoJ5O3SoliJsA8mX5HQWP6/7/ZThqHA+T
	X+rzWArXM579rxpwOcgEWp6YCL4Dy/jXqb5m+bYkujCSh0VSYQOV1qtsFz/dReEVpvlKq7pquPW
	gLBuCTsRp/Oq+CsrSAkSj3ud07B2mLYTpvmdp0xefrLDnDAFMCSLHuKhVFkOFIiuY/9ke5aHL/W
	MuQAh7Zp/RxXMDLEeFxhRloDldswxTvafu9b5qwmXwzNa7TNYYkX0MUSziR+N+osI6oqY9zw30u
	LAcZv7/UbDm000jIexEW2f5QslpxuVckOBcdB9tbG5pk9t0sBbuztPr0vj5dX5bNVNNBwEBZvnx
	U347pOOzPbpv4+k9mqcbSiQPDsC+5tBzXEPHXzl97spHHOr/M5pjALG2xxwlq+TECMr2+z9ax9Z
	hCtQfNsnecDQaLJauIVKxxW8aKyRnYk0Fc0ldcyIe2rbHpkGU8YhKlNhzjodgtgvyi47FpU/9hM
	Q40hwZWUSz6sJbf0xR8nXGwnFQpfRFIGr72onbfzJE=
X-Received: by 2002:a17:907:1784:b0:c20:f95c:9088 with SMTP id a640c23a62f3a-c2108dbee00mr306737066b.4.1786627547045;
        Thu, 13 Aug 2026 06:25:47 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c211aa04446sm14068766b.26.2026.08.13.06.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:25:45 -0700 (PDT)
Date: Thu, 13 Aug 2026 14:25:42 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/18] tracing/remotes: Release tracefs,eventfs on
 registration failure
Message-ID: <an3F1j_7CYxFk-FQ@google.com>
References: <20260812161340.2417322-1-vdonnefort@google.com>
 <20260812161340.2417322-3-vdonnefort@google.com>
 <20260812162503.6A4FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260812162503.6A4FC1F000E9@smtp.kernel.org>

On Wed, Aug 12, 2026 at 04:25:03PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Expanding the global `trace_remotes_lock` over the external driver callback `cbs->init()` introduces a severe risk of deadlocks and priority inversion.
> 
> Pre-existing issues:
> - [Critical] A Time-Of-Check to Time-Of-Use race condition between `trace_remote_tracefs_open()` and concurrent unregistration leads to a Use-After-Free.
> --
> 
> --- Patch [2]: [PATCH v5 02/18] tracing/remotes: Release tracefs,eventfs on registration failure ---
> commit 70ddc6ce63b80a301a72ec3efb7683b32447865f
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> tracing/remotes: Release tracefs,eventfs on registration failure
>     
> In trace_remote_register(), if registration of events or the init
> callback fails, the created tracefs and eventfs directories are leaked.
> Release the entire eventfs and tracefs hierarchy on trace_remote
> registration failure.
> 
> > diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
> > index ce2d517183b79..0384277070b9e 100644
> > --- a/kernel/trace/trace_remote.c
> > +++ b/kernel/trace/trace_remote.c
> 
> [ ... ]
> 
> > @@ -972,10 +990,9 @@ static int trace_remote_register_events(const char *remote_name, struct trace_re
> >  int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv,
> >  			  struct remote_event *events, size_t nr_events)
> >  {
> > -	struct trace_remote *remote;
> > +	struct trace_remote *remote __free(kfree) = kzalloc_obj(*remote);
> >  	int ret;
> >  
> > -	remote = kzalloc_obj(*remote);
> >  	if (!remote)
> >  		return -ENOMEM;
> >  
> > @@ -986,13 +1003,15 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
> >  	mutex_init(&remote->lock);
> >  	init_rwsem(&remote->reader_lock);
> >  
> > -	if (trace_remote_init_tracefs(name, remote)) {
> > -		kfree(remote);
> > -		return -ENOMEM;
> > -	}
> > +	guard(mutex)(&trace_remotes_lock);
> > +
> > +	ret = trace_remote_init_tracefs(name, remote);
> > +	if (ret)
> > +		return ret;
> >  
> >  	ret = trace_remote_register_events(name, remote, events, nr_events);
> >  	if (ret) {
> > +		trace_remote_remove_tracefs(remote);
> >  		pr_err("Failed to register events for trace remote '%s' (%d)\n",
> >  		       name, ret);
> >  		return ret;
> > @@ -1000,13 +1019,16 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
> >  
> >  	ret = cbs->init ? cbs->init(remote->dentry, priv) : 0;
> 
> [Severity: High]
> Does holding the global trace_remotes_lock while calling the external init()
> callback introduce a risk of deadlocks?
> 
> Because trace_remotes_lock was acquired via guard(mutex) earlier in this
> function, calling an opaque external callback with this global subsystem lock
> held establishes an inverted lock dependency.
> 
> If the teardown path of the external driver takes its own locks before
> unregistering the trace remote, could this result in an ABBA deadlock?

Current users are just fine. I do not think that is something worth considering
at the moment.

> 
> >  	if (ret) {
> > +		trace_remote_unregister_events(remote);
> > +		trace_remote_remove_tracefs(remote);
> >  		pr_err("Init failed for trace remote '%s' (%d)\n", name, ret);
> > -	} else {
> > -		guard(mutex)(&trace_remotes_lock);
> > -		list_add(&remote->node, &trace_remotes);
> >  	}
> >  
> > -	return ret;
> > +	list_add(&remote->node, &trace_remotes);
> > +	retain_and_null_ptr(remote);
> > +
> > +	return 0;
> >  }
> 
> [Severity: Critical]
> This is a pre-existing issue, but is there a race condition between
> trace_remote_tracefs_open() and concurrent unregistration?
> 
> In trace_remote_tracefs_open(), the code checks if the remote object exists
> in the global trace_remotes list:
> 
> kernel/trace/trace_remote.c:trace_remote_tracefs_open() {
>     ...
>     guard(mutex)(&trace_remotes_lock);
> 
>     /* i_private is either a struct trace_remote or a struct remote_event */
>     list_for_each_entry(r, &trace_remotes, node) {
>         if (r == i_private)
>             return 0;
>     ...
> }
> 
> However, the lock is dropped on return without incrementing the object's
> reference count.
> 
> Then in trace_open(), the unprotected remote pointer is dereferenced:
> 
> kernel/trace/trace_remote.c:trace_open() {
>     ...
>     ret = trace_remote_tracefs_open(inode, filp);
>     if (ret)
>         return ret;
> 
>     if (!(filp->f_mode & FMODE_READ))
>         return 0;
>     ...
>     guard(mutex)(&remote->lock);
>     ...
> }
> 
> If a concurrent unregistration acquires trace_remotes_lock, removes the
> remote, and frees it after trace_remote_tracefs_open() returns but before
> trace_open() acquires remote->lock, will this result in a use-after-free
> regression?

trace_remote_tracefs_open() will block until the remote is properly registered,
that is, added to the list trace_remotes.

After the remote is added to the list, there is no unregistration possible at
the moment.

I do not see any concurrent unregistration possible.

-- 
Vincent

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260812161340.2417322-1-vdonnefort@google.com?part=2
