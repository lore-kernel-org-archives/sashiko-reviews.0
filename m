Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E241E343D85
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 01:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790731137; cv=none; b=h53mgin39mdz4cyIG6oHUIota4f8Sjbump5SElWhRKw3wo3qW8IWt8Q3WORNJ/CpKPN+u5HMs0pBKj3GEoJmnDOq/rY7AsVerYGFnfPl3ZjigxgrkLbguxc2r5xNQCu76c1iReF58BTniylX4cSAt5E9+pUfN8TKRq1KObnBuu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790731137; c=relaxed/simple;
	bh=BvmcuRCXXXZPAuXMNLO9ZemCr9+Ceq6CToRmQROXTH4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o5Q14u0B2XHFDqfaS4Ccmi1gsirHWDEo21nWrENaF2nv2o6bkhNVpklTbzUGDduuX6WfMVHD5YZzxBDh5Ti67kfdTTSPUmfatylOCG2J7yXVZZ8y5gNnbVOTlAFTVVPR/9+/4oHN/T5Uwz6hG0ZG/g83/CYp3leazzT43mZvkKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y+fIOnMa; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y+fIOnMa"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0be20102fso4434125a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 18:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790731135; x=1791335935; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Un5b8BLNHk7eoJfvRT1Ls7qMfUvtMTWcSi/R3TKBoDU=;
        b=Y+fIOnMaB43/8QLJAbVpv3kRGp4g3qrx+El9INvYdmbr0Nrj1xZTQQSfVt7CKPFiqj
         U3wO61Q7qYpR6h3kbyLQB2HlCcaaXrjK7WtjltzQhy/eFgWrnHmKc9moib7e/nu9Frdy
         I2N9pg6lWPlrE2WBo8JXQ6qiYxKvBXeWwWp4k5cAzGvpZXivEkbULg54C9mDOIKlsx+E
         sLGkIcn+VfbvShSWIw6T0p1cpaMekjTJ3vzXVUQvlPZ8ak+wdeMZTgES8CrxcHrX+QXu
         RhrK8PvSmgi99Ujc6pNf7GIKPyBRUcZTUR0SHuvCFG6tZMGSUBNGUpp/lEJi+OaMBbZc
         9K6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790731135; x=1791335935;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Un5b8BLNHk7eoJfvRT1Ls7qMfUvtMTWcSi/R3TKBoDU=;
        b=uzM/5XhHvkmyIH0HrwoFMTG6NDyvHiqLprYrZDuHT6nyFW3jjfTsK+uldhGHUmrnUZ
         1nHCO0gsGU+83O4ut2zXjzaxOfmlHxYkONi1nr6lIwsqSZgm4Qrekfkvynk8GZBkLrSZ
         7Ry+XA5DKaEn5BXucAf3365Jtp6HPeMKnw6LgXssVYui1ckkwM/Ev4Cp77j8Yh1WuMfn
         KuDiEGIgDvVUXYbLb2XSL0KhZquPxoW3+iM+yhkliSWTf4vGN4Yq1Mld55DB9D7WruBA
         wxpF9dshFwuNQ2fUsnFkLWgItYno53Krpt0xm2RUcqdrABZLJ/0w4jh9LTx+fYBt3OUv
         Opzw==
X-Gm-Message-State: AFq9FYLA1bIpB7wEyIRnPOgLKGg7lRb0m22/DMYJChMK/4Djk3ukRr2v
	+oY13arHjj5zDRgaP2Uxl6RghkWI6+bbcAXjjQVyj4bOR+uZC8RcKwFd75JiCKaGpZlnijI0hpa
	LZAl8OeQ6+cV81CsSPV+tdEd9QtLU6d1xfM9BwWsOaQf7PSmSJ1nqMGsZ9kZ+M8tte0xMfXU1b4
	FrHOel31QzGS94AWAGt2v1frQ8crnGkY+2fP3onuw/pMOuKNwU
X-Received: from pgbeh7.prod.google.com ([2002:a05:6a02:2567:b0:cc7:d296:c015])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b01:b0:39d:fcbe:fe04
 with SMTP id 98e67ed59e1d1-3a4bfad164bmr1055312a91.2.1790731134877; Tue, 29
 Sep 2026 18:18:54 -0700 (PDT)
Date: Tue, 29 Sep 2026 18:18:53 -0700
In-Reply-To: <20260930002238.649421F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260930001341.3171558-1-seanjc@google.com> <20260930002238.649421F000FF@smtp.kernel.org>
Message-ID: <arxjfYTdZyM2HejW@google.com>
Subject: Re: [PATCH] KVM: selftests: Make guest_snprintf() a macro and use it
 as appropriate
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 30, 2026, sashiko-bot@kernel.org wrote:
> Closes: https://lore.kernel.org/all/20260918113631.634233-4-gokul02k@gmail.com
> 
> > diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
> > index a6a3e16578959..817d4d5ca7cc7 100644
> > --- a/tools/testing/selftests/kvm/include/test_util.h
> > +++ b/tools/testing/selftests/kvm/include/test_util.h
> > @@ -238,7 +238,17 @@ static inline u32 atoi_non_negative(const char *name, const char *num_str)
> >  }
> >  
> >  int guest_vsnprintf(char *buf, int n, const char *fmt, va_list args);
> > -__printf(3, 4) int guest_snprintf(char *buf, int n, const char *fmt, ...);
> > +
> > +#define guest_snprintf(__buf, __n, __fmt)		\
> > +({							\
> > +	va_list va;					\
> > +	int len;					\
> 
> [Severity: Medium]
> Does this macro shadow caller arguments? If a caller passes an argument
> named len to guest_snprintf(), it will be shadowed by the uninitialized
> local len due to C scoping rules for statement expressions. The inner len
> is then passed to guest_vsnprintf(), which could result in a random or
> uninitialized buffer size.
> 
> > +							\
> > +	va_start(va, __fmt);				\
> 
> [Severity: Medium]
> Does this implicitly capture the caller's variadic arguments? 
> 
> The macro internally invokes va_start(va, __fmt), which couples it to the
> caller's stack frame. If this macro is used in a non-variadic function,
> or if __fmt is not the rightmost named argument of the calling function,
> could va_start cause undefined behavior? 

Ugh, and now I remember why we ended up with duplicate code.  Lame.  I'll drop
this and grab Gokul's original patch.  As much as I want to keep guest_snprintf()
around "just in case", in practice I highly doubt we'll ever use it.
