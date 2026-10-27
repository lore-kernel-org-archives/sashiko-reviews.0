Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122990;
	b=vwu7qlN0V89fN+BQwqyo6NWQxEPgt6BN5g0FthKmrRjoo3+gU78/Kj2tImNpGf9f+jDu
	 WWjeYSxG9tFTuY6aWtF4PPmdVtvnB1TTXS80vUn22Bn6rqd1B//sGY84tN5UOEaR8z99G
	 lPV4PvuNVRJPWiCbg3Uln7vVFXlCRynG0Q1xCE+4Cl6z3qmZmxle0OYz5tu/BmhVIKGCZ
	 y3Yc9FcUzxm28hIfBBn8HG6FQW4uSL4WPDIZJ1rjq7MqqONVTcljv77/7kDcAwHq7jTTg
	 NEs5RCtqDgxq5QCOogto2SfP6u3qi1WjxaH+hD8gVGTiDK/CooLmbWDKK/NvhE2317Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4rIPaOGkz4dA6rLpWkpTWRnAekHyjd26NnKIbMaNQKk=;
	b=Lz2TC6QSWE5oOec5r8hvuGTwNg/S++XuIWZGldAKp1f+xC73xIYi4UixAw3rnPHYRSHn
	 uRbUKH+rYz6F8H2DdAvbVqTZz7AHmQ3YAUfD0HX18dRB59JFO8m0pC6pmsmreSRNHjre5
	 XDikUdX03WEB68fM7lHS3YF4i5M8xpHOE/In5sTYXFtcoGVGJTvkg4bIaGucfQGL4x7L1
	 2+XgAk/DEaUZbHiAe+cGSNWkUXQtzkQpPQZeBGgD3okD0lEiGKj5ONvAZmNcCS7WwC1R2
	 haCW0pPnSTF022D+sdJKXhxtwtJKxp+52mo5W9oxMFLwmqrtHABEP5YntoXph3956DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwqFnw0k;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD18606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 17:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD18606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwqFnw0k
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c423b145922so9319666b.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 10:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793122989; x=1793727789; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4rIPaOGkz4dA6rLpWkpTWRnAekHyjd26NnKIbMaNQKk=;
        b=QwqFnw0kB1bPqjn4Ey8wXDAZDxHebdBQobaP7A6pah7NVaqkLVFYLaMxf55O6A3FP5
         dHV1GQbzsi4bGwf5nXLWf0iJeistmugiwFZaIpdd2het4imXe64CvpC0fHayoaYfAio9
         sZu18/ZnEiuBt3D80HooNMy2ywyCKkJrqeGQKDWOetSZwSjcEtPojTPZ1EgfvfcwoiZK
         4SCqzvfonlCGEdZQnT4eq+C0aTCysCYAzy+1K2UUPuWnPAkMQRsW2GKuTfXM7D226AiW
         tNgNReL5NgqklI2uAGKpGfwAksILWn5WZMTTbNfHa9d8dpAt5/FJnzsikdk43qr9qByA
         OMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122989; x=1793727789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rIPaOGkz4dA6rLpWkpTWRnAekHyjd26NnKIbMaNQKk=;
        b=biaXwfrHKW3Mf19TfGT6pc+nKadG7+yq2Kv19ASN7VbmyU+pcc8LDTc+ABWNR20k53
         ascLCo10aLdXJ+fMKt1gGVOegTBgpiCQUr7Iv8Ek7bK9seF3ss3YBqmSGyaTdJ9nCCXX
         Vy7epI3dQ+6g5N71ra2ldsRHpiRwtaLD64s0mee+gGi5EiMU+xtYJNsI4LPoulZR1jCl
         lIAHVqTiq5Zl5nEbNX840mSPhrPbok7YfH3Kw+/JKF5lQHLC5MrCdcBkJ+TCHPhNSSXX
         LzdVJGBh1aqqmJlWPtqRPh/sRBbR6o1UtUHoKLUB9X9Yg/s5vkmOg+NHezf3JgZF01JG
         FC/w==
X-Gm-Message-State: AFq9FYIvqYjKg2nUYxw59wdL2c/Gn9TmzlOJqPm4rWKvQnAh2j19lGYn
	y1A1F/GH41FMCMoHu4NshUIcZv2v8jHC4bM7+o0WrSkFxnzQCTqIcjrw8kdaVAb3GqE=
X-Gm-Gg: AYBFou3DhWoeiWbMUa7iAy1I98yryG/4HocAE8fc2IlnEJI54KXEwFiidcuBQPGxQtT
	W7GZtOUcVJ2EvRk1xLjCuRb0uM7t19GouCDMYp2mx8F1RhlXH8VkRahN5Jw8YA0WXH4BYhpvJIz
	DAanL6kxz4y6ZhOfyXn48qoj/8vd6BJZow0l5kidyQoFIeKH0TEldS4p6KnNJYJCocUkkAlxiuv
	o/DmW7hfddzUB+SmZPrr2LSWToTqfNT6KWdmhhKEWZ75cvCaKQEWJ0kjK2k+1/H4lbkjmdFkvcU
	QEGgjfMkuyMhWorY+dnyMv+GHcAi412Gul6eJtg01LfnajB/u2olBo/FDnJTP2OtDBiN0Dq76MD
	FaXcoWDWQGRs7dRvjVf86eaH+21YR9UJtwzsb7VqeNLCuaWGaLSkFTTIr4+L/Jr6UFVn5t8KxEn
	KhiFpJn/jxno0wleG8JYTQ/mHyoMhf0tZjXMKNDw41RMKO+h6jep44IaxS2fjNiPNDepghh0ZGN
	a9yvCsJXhuokv8LXGdV
X-Received: by 2002:a17:907:3e07:b0:c27:420b:7c79 with SMTP id a640c23a62f3a-c46bdec7fa6mr1214967166b.48.1793122988624;
        Tue, 27 Oct 2026 10:43:08 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7a7c2esm484748666b.80.2026.10.27.10.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:43:07 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 27 Oct 2026 18:43:04 +0100
To: sashiko-reviews@lists.linux.dev
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	"David Hildenbrand (Arm)" <david@kernel.org>
Subject: Re: [PATCH] mm/vmalloc: Bail out if in softirq context
Message-ID: <auDiqLSjI1qrn3rd@milan>
References: <20261026102503.30860-1-urezki@gmail.com>
 <sashiko-outbox-186354@kernel.org>
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
In-Reply-To: <sashiko-outbox-186354@kernel.org>

On Tue, Oct 27, 2026 at 10:25:23AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] mm/vmalloc: ABBA deadlock when calling vmalloc() with BH or IRQs disabled
> - [Medium] mm/vmalloc: __get_vm_area_node() irq bailout triggers warnings and retry
> --
> 
> commit 9fea18279139941aa247a1a577dd5e101116871a
> Author: Uladzislau Rezki (Sony) <urezki@gmail.com>
> 
> mm/vmalloc: Bail out if in softirq context
> 
> This commit restores a softirq check in __get_vm_area_node() using
> in_serving_softirq() so that vmalloc() bails out when invoked from softirq
> context while still permitting callers with disabled bottom halves. It also
> replaces BUG_ON(in_nmi() || in_hardirq()) with a WARN_ON_ONCE() check that
> returns NULL.
> 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 44e0eb32708f1..5a949525b9db8 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3271,7 +3271,13 @@ struct vm_struct *__get_vm_area_node(unsigned long size,
> >  	struct vm_struct *area;
> >  	unsigned long requested_size = size;
> >  
> > -	BUG_ON(in_nmi() || in_hardirq());
> > +	/* IRQ re-entrancy -> irq_exit() -> process softirq. */
> > +	if (in_serving_softirq())
> > +		return NULL;
> > +
> > +	if (WARN_ON_ONCE(in_nmi() || in_hardirq()))
> > +		return NULL;
> 
> [Severity: High]
> Can allowing vmalloc() in task context with bottom halves or interrupts
> disabled still cause a multi-CPU ABBA deadlock on vmalloc's internal locks?
> 
CPU_0           CPU_1
 vmalloc()       lock(B)
  lock(A)         vmalloc()
   soft-irq        lock(A)
    lock(B)

Such callers have to be fixed at their call sites. __get_vm_area_node()
cannot detect ABBA deadlock which involves a lock held by a task-context
caller.

--
Uladzislau Rezki
