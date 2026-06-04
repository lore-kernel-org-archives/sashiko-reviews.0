Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB862D6409
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 07:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559960; cv=none; b=sCtlf1Iwcru5HCe/OymIbJ1akMKff1418UT0AuQhRYZUG7FJzyF1GCGT1GwGKkyJOLR6+0PdZlGTm9jO4PsyaUxYJSi07X9rVeWs87sTSQBDI//GwOP6u6eL+uvjd9Z0eSJyI8nqcsV0chSF55Q+eVIb11Imt7m7FfDGAGGoiBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559960; c=relaxed/simple;
	bh=Abt7s4PkODrLPYtt/GowGs46G361XNVIuLXOTwhVOkc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0Xhyikfty55VTXnpx7xqAhvTCiJ3Si9S9RMKXNf0Fy17J0b0w1+mJXGf/K7HXOh8vKU/Owwfpn1w5DPTCB16gzLxHvCixaBUab6T7Teo8oFhB1x1YZN5sTdz2mOcoua1S4t934+lcWzIvVIoaYjQcOhXYn+1rpj7WmB3FrmUj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1GIwhke; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1GIwhke"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso3565485e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780559958; x=1781164758; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K0S3H7P3znE+t+BHRumrEOEZYnM/V06pBrS5mPyks6Y=;
        b=S1GIwhkeHzW1PxmvTwi2RVV80pIdFvrliDjZXX2FOoBrcVaq/uofZdnwwrx1in++if
         wBmqp56R9J8gSnaP/m/vtlBoiEi3eLfeoIOyi2CB05LpssR5VFmnZ6h6ib53Ief8EXym
         LopzxI6fI4U6xXR9u1jifYWN+9YA4nSwqMc2ZLLlbP9kwCs1J/9sTA8aHY0gzH6RbQRy
         ZmCkjFqk5AXz0od1DXEIdfGccSRfdxZp6HBPi7zagRJccStALQPIZbfoBB7gv3VZbTlB
         zrHe9lAWjVOcyYt000gzt2TN7/cwV1sj77M/6xX0AiCRpMRc9fTgkZ9ACT/Xao9yoQNO
         aAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559958; x=1781164758;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0S3H7P3znE+t+BHRumrEOEZYnM/V06pBrS5mPyks6Y=;
        b=IpaOycD5CdeQR911QBd8TBeBjxk6LRA+dFBXAE8ijvCZ/6tsSjZSdjKdWcCNj0R0LL
         WG38PTFRSHsWppxAv2ywEKCf4tTGu/p3z3/V+50YMXMcjfYebPrGcZq/UTdu7BSijrQV
         J9TBuq+EEsV+IFQ3FeYQ3jDPPK4yh8gjTmln4a5repAs/p6gH6Vqo1mvi6fqk6VlcHmh
         ZeI9Uc7HvEy7sRxgb24pEAD9azexBlebtlb/TEL2pO5aMy2v3AD/q/w2PvhX85ykPsAe
         HJGBLppXKi9fH8srtJ/MbkgrnAnLTUwjc0/kaVGKjQWjN+hPHjxhndP7BFybfuk82h9m
         galg==
X-Gm-Message-State: AOJu0YyNfJ5w2S+fKrDVgWengXcJfSlwBxaNAgTUZO4+6yolxW8rByeD
	RODtI3YfakBGjjOEasHzUEc0KGw5fHCWqK2DJ55UvdcQlQcOrBC/8dKZSGEjSg==
X-Gm-Gg: Acq92OELMaoO2tME6e4TQrhL4rn0/YRdGbWxL7duLZe9HIWE5lh19MCD7VgMz0A+L44
	FR1TVD+Uarkgs3GZ1FC5LUrtunjHdwxIWroYbrVfLr+RRMIP0qDs4FebZ7W4g9AX6u0phQy5m51
	LCt1qMjVQvsXJ/cM5c2r6gU0Al1pAbi1r/6C/vu3oXz82HE+ZzEyNYGiQ1sGjgYfCEs2E8OiWpC
	cH/AkkO8WrW2p0uBGuPass/+9MPUDeb96U2cUI3lzAgbIWkgbwMUy9pBU1UVX3tJ7WWUiPZBQi5
	LN6J47Ggttt9yIYkyvpKEbFk3/JrKOYzXS5fYJS6FqfY+YD74KBhROyuSE+cwZK4iTBZEw8G2DZ
	A+LrLhqo0huY9jdhV4xo/K7vjaSmXcDMHfYYasIDaczRAGgojVzbSPOnJ5vWkZibXPqJfjWy5kU
	1xQAszc1av8Y4RsROalleQzE1b6moEJk75x+RB
X-Received: by 2002:a05:600c:821a:b0:490:c024:2ec8 with SMTP id 5b1f17b1804b1-490c02430cdmr346815e9.0.1780559957627;
        Thu, 04 Jun 2026 00:59:17 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2ec711sm13840200f8f.12.2026.06.04.00.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:59:17 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 4 Jun 2026 09:59:15 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv7 bpf-next 01/29] ftrace: Add ftrace_hash_count function
Message-ID: <aiEwU0CyceOkPrfV@krava>
References: <20260603110554.29590-2-jolsa@kernel.org>
 <20260603112630.3D1EB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603112630.3D1EB1F00893@smtp.kernel.org>

On Wed, Jun 03, 2026 at 11:26:29AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The generic ftrace_hash_count() API is incorrectly guarded by CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS, returning a false 0 when direct calls are disabled.
> --
> 
> commit 61129b2eed8ea43ed2c045ef25d031a4504c8af4
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> ftrace: Add ftrace_hash_count function
> 
> Adds an external ftrace_hash_count function to allow retrieving the hash
> count from outside the ftrace object.
> 
> > diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> > index 28b30c6f10314..02c24bf766ced 100644
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> [ ... ]
> > @@ -551,6 +551,8 @@ int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, b
> >  
> >  void ftrace_stub_direct_tramp(void);
> >  
> > +unsigned long ftrace_hash_count(struct ftrace_hash *hash);
> > +
> >  #else
> >  struct ftrace_ops;
> >  static inline unsigned long ftrace_find_rec_direct(unsigned long ip)
> > @@ -590,6 +592,11 @@ static inline int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace
> >  	return -ENODEV;
> >  }
> >  
> > +static inline unsigned long ftrace_hash_count(struct ftrace_hash *hash)
> > +{
> > +	return 0;
> > +}
> > +
> 
> [Severity: Medium]
> Is it intended to restrict this generic API to configurations where direct
> calls are enabled?
> 
> It appears this declaration and the inline dummy are placed inside the
> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS block.

ftrace_hash_count declaration is in CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
black, the inline stub is in !CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS block

> 
> When CONFIG_DYNAMIC_FTRACE is enabled but direct calls are disabled, any
> external caller will silently receive 0. Could this cause subtle logic
> errors for users of this generic ftrace infrastructure?

ftrace_hash_count is enabled for CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
as are all its users, seems ok to me

jirka

> 
> >  /*
> >   * This must be implemented by the architecture.
> >   * It is the way the ftrace direct_ops helper, when called
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index b2611de3f5943..57ab01fd00bda 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> [ ... ]
> > @@ -6288,11 +6288,16 @@ int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
> >  }
> >  EXPORT_SYMBOL_GPL(modify_ftrace_direct);
> >  
> > -static unsigned long hash_count(struct ftrace_hash *hash)
> > +static inline unsigned long hash_count(struct ftrace_hash *hash)
> >  {
> >  	return hash ? hash->count : 0;
> >  }
> >  
> > +unsigned long ftrace_hash_count(struct ftrace_hash *hash)
> > +{
> > +	return hash_count(hash);
> > +}
> > +
> 
> [Severity: Medium]
> Similarly, does this implementation need to be moved outside the direct
> calls block so it is broadly available to dynamic ftrace?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260603110554.29590-2-jolsa@kernel.org?part=1
