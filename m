Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793829405;
	b=td13j/dkc89BF19AK+T4jVzpIQJNJNSlnnlNP5TNkip1Fh9t1pe8/jjfZmdQvTPtAy8P
	 yZEeE2d2V9shfFmlDbYqP2xAsr6jWz9zN2h6opfTXephq2ccb8us9QUd4+3znsYW4ak7T
	 fGPwKIqc/DrgPkvQr8pohEVVDAR/uOEfiIMA8QX9Vdqkty1avR9DkrSuh6ti/40xL2Swh
	 S1rY/xNrVcOJWDTdetQB3bkJ3K1Q6AtfRVBWLWi6lrKIHS/os2OT8tjEnx5X17bgmZvKX
	 UF28uw/Sul9n9aaPKJsw4eEUVDE2f2NJ/qg7WC9zbWC11YXwAaLrGWUHNGJs3wWgemQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=SfUwspt8oKwE6fmkvVkDaSTqfrh6S31qCJ1SV27baGk=;
	b=SfgP8Q61U+No70vacTaB/AxTqcvbDfWcDxq4yVt4hcRJlGOdyZdND+zHDmoAEORZsF10
	 hZrW83xyl7GGImYjJY+lvSO6a3eq9J0SJunpsN047zjiSsuloUHFf9SJCb7E1tdQx+ZVO
	 S8OYfUZZoFkP/KDmCAZ4FVMMzcr5s09IkRdNlk3qoKIYKK2l0pLljxaMYoWB8CvfatkwY
	 tC2oNvgqxC1FTBDe1GmvF1ul/b9LmEOh036D76oblYU6ROhAsS0gOt+zTWfYlcdNr2gY0
	 TW/ukp/MTOyczwJ4I5XUJIwsynV0JWI2djHQMIQznXbtO2m87ek3ndLU2oFE2eaEMEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VJYzx+Ir;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEFF60C299F
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 21:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AEFF60C299F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VJYzx+Ir
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6de2f213b7aso585141eaf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 13:56:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793829399; cv=none;
        d=google.com; s=arc-20260327;
        b=eHzu9pGYjDEXP/LOlaIZ/jYUCpj0hL4SMSkdMJso2aT5gpeGBzoBnHrorNB7UYyANI
         Dw2WwlnMSOW66geJUhRsLq2wKuwg3OmMOYEtEHaRLGMXZkMNCvkhaDu7ub+HMEizofiI
         z5Pc/xdfOFSmgH+2xJ9MWEdNRm/ojQrBl2ua5tDS25iw0HWRbzWoQBBvYJRg5AWh7eVq
         hGlAqcU0r+0x1i06kaS757duOtwzawFSy+lTuJhBR6pI96+7y+Waiv+daszPPemk9yIm
         skFLsTcGY0VpM8FruXxSmSaLGFWkdu6B/aTAoVNEh7HvlxS0XeVy2qxIulQG89sSPdqz
         NDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SfUwspt8oKwE6fmkvVkDaSTqfrh6S31qCJ1SV27baGk=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=U5bJcHAaUSW80hWIn6a52Pi3EygvClLOQ9Ns6HAHIv1s0VzaTPIJqL/CwxX25p9GlW
         80JqnLI2KxzV3bXYe1YY7d+JYNZ2naO3WBnKrzIRytTo6GR36jz7ObUzjdeqFBfNzeUc
         KA4Rl9H2ovvlq6VyaAmP1acDg9ZbcnPvc9LkwJPYJg3K5av1ybWQkO2JKZAdsqxbsMx/
         /m5s3/xj88MosQEy6FmnKHiL6laPWRJ7idvuIFF2azkO2fBy6JaqIvt4mBiMDcVEEjTY
         j3Rph7SCxEBwQa1eEfCL3rqYjnAGuWF4+20dOP2mdivyhuuDLAMtPO5C4wWSupTXO/EM
         bCMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829399; x=1794434199; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfUwspt8oKwE6fmkvVkDaSTqfrh6S31qCJ1SV27baGk=;
        b=VJYzx+IrIH7CZ6tj/A2oYHe5Agaw6DfHxA0ujHlfYjVyXDg2ukVjoz4UqSrxMzMFIw
         JCMxKyTW668Eh2S1AIQhkVAPikkQbvZ3T0O02GdCF3F3PC3T3Ty6x3q6LDlQJKfAn4hL
         K/SzdxiosieaeCIV+WDxJKCUmnPVe/z9CV5Fklt4Ahbwy8nGPSTFm9rWmBh6S/+tE3XA
         +uThZx7EUoYrDKEwg4J6mwG4Nyk4boELfnOFmKNNoMP2hqWnqBVGQuRgERz9scfU+qyh
         RrTRqgl1kDNCEjAblgFTrtLIdd9xnHI5aE0+eWm469kRCPeRNfzhDuUDn6bql2cjWRbQ
         6diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829399; x=1794434199;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SfUwspt8oKwE6fmkvVkDaSTqfrh6S31qCJ1SV27baGk=;
        b=uWOW+HFS3dOHrIfP0C2Rs76a3h4cMYLBLLa5p4Cut98HCfRwJV5DOXFuYjKbaZUeCi
         Iq4D1eke4Ns7MgtM8pmRsmj/KkY/N+YkFYAopXr2LyCUS56Md/wy3QfgXpD7CexrDaP0
         KINNcGmg1HQ0bHlqY+W5gBaE66DJ4nZdSvrroW+yJ0oQdpcW9lrZgvtwTW5XtdCHobKT
         LUoaxFULW9TTOIfkLrLJBCIUhZ3BVsrjpAWLnXwAeXopd6tXphdQD4I/0XLyx3XIxIM7
         UUCM6RmTjSRX1gIyv+mZKmYpwvAJUeU74fb6XKBS9PfAh3ItJ6nC1Ud7MetPH8TQN9uf
         msbQ==
X-Gm-Message-State: APuU4Z8eSr7pRsiapBLfBJqCeF4MXeKgdbcbPtOdGwtIheGvY3nrUeG2
	VVhOJExun82H2wBSHorf6Ns2FoYFT9OPzLVW6vJAysmsYsEzzW7QTPtLBL4Gpb3IolbNedqNlf+
	5B2KE1V0z3dYoRKIHbvRWQAb4J2YJqLD7l83c
X-Gm-Gg: AYBFou0/88o9RmBRzpX+VkvCE9CkIh3rv/COxZsyEVzEXFqcwNE6lwrM9LKYNhaQch2
	7KvrU7Y2CXqinKxjwSLkYhM0rk0/oevzwioLKi/8FIItb9O872IwJRqeqDiog0ycAnQvdITDax3
	3kTaJE/Kde0OiveAufgm/cwYsDFu/EwLo6El4thGXUNd9wqGoiJLMrAbYZWMpKmhDTeXXsDLE52
	yLAV49tgqfwGNFpAMfFO9Z8RPxtmXh6HPiF98/+o5zQCeuJMbnBbrnApFEkA80sOLrCZcqCvfSY
	HIq5H7q6ArKWODatj30FOZkI4TzLgkdb8yOaEAQTa5rP1cjKtPTp8LyGdf8XIW3QjLDB9kUvHVP
	pnxyTDyySUD7PfYuhNIrpC2ZqYTtVO6vsxK57jIWIS1zV9+KLlXWbZZhDK++xpAyvTKNJsEQP8a
	qiLnSXUB9lK/fyrLsqGC7I2qg=
X-Received: by 2002:a05:6820:603:b0:6de:1071:8b1f with SMTP id
 006d021491bc7-714f2a0429dmr9962373eaf.55.1793829399087; Wed, 04 Nov 2026
 13:56:39 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261018074528.974953-1-lalitmaganti@gmail.com> <sashiko-outbox-176006@kernel.org>
In-Reply-To: <sashiko-outbox-176006@kernel.org>
From: Lalit Maganti <lalitmaganti@gmail.com>
Date: Wed, 4 Nov 2026 13:56:26 -0800
X-Gm-Features: AclHuK8NpuRRp80yN1mGeRCYx_90ftTOvJ9RuOxDbLKOCu_Y0da17iLCXb0Bq6c
Message-ID: <CALuTzHHthGbGDM6+hH9quVrZx4j-hCtHY64HmpbwzVgbutZ=Ww@mail.gmail.com>
Subject: Re: [PATCH] perf python: Accept events larger than union perf_event
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Just wanted to bump this patch in case it was missed. I believe this
is still an issue in main today.

Best,
Lalit
