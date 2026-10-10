Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6BE1FBC8C
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 03:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602612; cv=pass; b=kEyTjBsfb/rflFoqyyC0Gh50xgMtG5R4B5wTOxpYvOxMOltyzOEp6c76qqSECBCSC8EpvjfU970ksq9z3J+FaviBFNX6SB91FL3hC+F4PAnjkKnwms4hjmQCs+IUcmpzHGlw3rYqKrTe1wnh/QjlJsF0n5bVju7JfTyuPZPeRxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602612; c=relaxed/simple;
	bh=JiaH124cSDLttBgBQlt+Y+ep5vqL86rm+g7iJIspyxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fs4yFQeaiWjJ5xN1s8cf1N4AO3O+zKkMbDjElxQz37NnJmQAnEdjc+fDtnwUcDNowUh+t7tTKTyJqm9DK/H8e0xMXaEl30AIdCy47gUywhRS/rShLk+uydXYpROqR9A8XYacVrlboNCMU+ax0UZ3xZdgZ07C50kEOFTErmNAD+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqQTkbkk; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqQTkbkk"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so107181a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 20:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791602610; cv=none;
        d=google.com; s=arc-20260327;
        b=UlB8ur9t3X8p+/TVHBj/nD5UjJ7ulTBvHGVrA48eyc++i9r6uu4OarlPBbRuN9veHH
         vQJMkqWcLlCcIJwd+RdeyUk9Uo4mX13BLKFY8JSZ0hWdyk0k+jtY2faYCBHhbe4SLWB0
         6fCpfEqMj9jtPD4RhZJnn49vUKG+n5cfgJADeInn/hSQ+7a8fHNYTdFzSA8du9hN68Bn
         Gz+AedPpT3FuCWguh6Y7xrhn30FgbZNmeo4tPAfcRf6dAn/JNvm+EHMUf2euH+Gx/OsZ
         vO1m5IQhxIG3yBN3Yvu9xRyRTJGgw9shRe54JF4MMMMuDTRpER1w7XfB9+nI//VsAjar
         5SpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JiaH124cSDLttBgBQlt+Y+ep5vqL86rm+g7iJIspyxk=;
        fh=8s/m3WFbgYWSrFq8O6qnuwJh8MouRhxqinKYkPkfiw0=;
        b=FbkmtOWmBeHk0A6oDECXBf0L0zM6qzb9FSDZVdSdNdLFcfnzpPvfeOhAd/3OWdylxM
         gdytcQxsaL+nUYCc/YucjCv1Rc8RW6izZsxam+igBsro+1VYe8HPvF5Vk7BZYs4LX1lI
         5Cuag8f9RN5czaFOUaG19GfiPEEBQu/5fdeDLs/lFeJ/hstBYjlpAZo5MiVKXGgCUsEV
         BtiHkz6IEN6ayAAzpmLZRunoHJZ+8wgY8/reWTYuxJs9tWfZveKimtzQeQMYc9fXi107
         9CtPFtYi6XIPqOGZrSD8JAx41JiOqy6h59Y8bBcfgT1mCzWEN17vgBbVLAR1kjlqCjEO
         OU5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791602610; x=1792207410; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiaH124cSDLttBgBQlt+Y+ep5vqL86rm+g7iJIspyxk=;
        b=VqQTkbkkfCvuOiQUpedQT8ZL++1aZM8ZYHlJr87MxdXTXus+ZdYLvc8rYhyksaPJyq
         lrs/yYX00RlobZ7Y69Bn2PbZr/UPa5a6WND9Sn1o8zWKonPe1xmuLNTUkEfNP4HfW4cu
         +iPr7Qv8EMTWvLOpGFd9tDKN2v5SXx7zEQv4GmeDQVSGEYjUsWfcNkhNbBA5bTT0K8Qx
         RD9gWUKmB3w1ozaQopkR0eUZGxTAD80Nv5ujx1ubhoIqrHgZ+VvGXz3tFVTaEJ6auxjk
         28dk4tSetkOudNgOf14DtTqgkc3BzeXu05dQC3wBSXE2cSPvSfUrhclbEjGlcnVb7JaT
         TGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791602610; x=1792207410;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JiaH124cSDLttBgBQlt+Y+ep5vqL86rm+g7iJIspyxk=;
        b=l22Cnm+qnMsDf1CFtrbIJToGsQLECyCD4H5Bv2aCynKaFZWuHXAglhQfgGAMGCvd7G
         Ne/oTincXwo6BX4KnH8dJj+LmOQTQpQjN6j98eCvpmeUygPoyS3GisqMxqnSvuiGxktU
         GZ7ifN3DY+8vbaDaShRcG7p8+fSfbZ3ZM3NPp7KZWKd5Y9L1nVg3O5zn9aQZyVy1tm+A
         Nl3ieQp59L7H9oZxiXeqUPgrbH4baJJY3huAUssTT+mxZg0DVFXtWqqvv2w0qWAFaAAe
         ScGG9aUrMTi1muAJXohei+jIcYe4dzEZx3CDcpTKWjDllyM0fxKBMl0mNa/e2wyT9vQB
         JYGA==
X-Gm-Message-State: AFq9FYLDiVhdGFCcPXBYNb8scydWlzkGdiOMowYdFCSYK3EPWwI1rJpW
	SpQnD1DzOCyZnCYTc1GGYh+rjNK4exBIJQFMG6pvgRCEGBiH5TPkdxC3wCMZNu/4yXhkfFwt5fu
	8YCXSMHp4lYrVo9JhrroD8wC2AscQYfk8t1Kb
X-Gm-Gg: AYBFou2F5qC1BzTztnXX0MIxQV0okq0YeGfgfiqQb8ADfaNKnyBepW5ik7ja6I+gRjS
	22St3jwhAXi7pmUsrOWUmHDjT1s6U2WM0TTYLTzgEuUsFp4+F75poN+rmNwpRJsg0zxrhks/HhA
	kKhYtySc0Gcaxrte5PZFV20cpYxbSLNZafaSBljzslFRLTIZIuImXeLWN42SkT0lMTdrGy2u416
	E0rDmf42wqKaLdYu91sgfzykYy0ldMibz6rMxC74sOrjYiLzhOeNFsliAkm6mWP+jvMoneJvjH7
	BLVr0dGtAvlKYVZja2t5WWAUETenJNgjN68nZl1zthCxE6K4UIhnsz8BvxMJR+d9SqNIVUqy1m+
	Y7a1ipyixoHeFDZb765pvUV7H5jgbEHvIZMVEzIs312E0WzaJGGPPoTWxKyH5hp3wuHADM14aRV
	6I8nicX28b6viJk2vMWyE/ICq9Kw==
X-Received: by 2002:a05:6a20:d704:b0:3de:44aa:a0fe with SMTP id
 adf61e73a8af0-3e16bf5d3a7mr3520554637.71.1791602610344; Fri, 09 Oct 2026
 20:23:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009112634.33436-1-phucduc.bui@gmail.com> <sashiko-outbox-165390@kernel.org>
In-Reply-To: <sashiko-outbox-165390@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 10 Oct 2026 10:23:19 +0700
X-Gm-Features: AclHuK_uKif4wq6OZ-W6ppQilaYG0g5of1u7ef6wcj74Tvuv3OR-Tfopp2PgVYk
Message-ID: <CAABR9nEdvgNo-ENO0BK343bdpXeddw+K79GGEHvZTt383sx8Ug@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Propagate reset GPIO errors
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: High]
> Is ret uninitialized when used here? Looking at mcp23s08_probe_one() in
> drivers/pinctrl/pinctrl-mcp23s08.c, ret is declared at the top of the
> function but does not appear to be assigned a value before this point.
>
> If devm_gpiod_get_optional() fails, will this return a garbage value
> from the stack instead of the actual error code? Would passing
> PTR_ERR(mcp->reset_gpio) to dev_err_probe() instead of ret correctly
> propagate the error?
>


I'll return `PTR_ERR(mcp->reset_gpio)` in v2.
