Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F063B584A
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 06:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779086262; cv=none; b=Ehbw1CVdYEeEBYDWoTq2ftnPVIBOcZEOUu8bgVKwhJVGES5mt6Bvw7cVRc0yK033/ntvb87uTAKEwsNPo75wtWrCwA+UoPmaBLOamSa4hAzCQX7NId510nR4VleS7ak15hVSJWhlbfc7+0UILWtD9G5+gz3AtekhvfnkJBuzlCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779086262; c=relaxed/simple;
	bh=4opVSGVK1pUcuw9hzNkK2EOLoJi7osP12yDz7HhOVnM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=G+yEAzT4xhvSn3u5y8M6gODeoJcBeXPNmpznLs4iuWNkhTL+SpjDbl0ppwhjwFIWHHsaEmPPT/NqbuNLfUBWqA3he9c9NM3XwjAfgy0bfSDYDQopEdBJXaY84l9CaXAyYZCE+ZccEbpbXfKdCOTSed/27ItyXxR0qNRXqYMWLi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIuGWl79; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIuGWl79"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50e594413c2so14435821cf.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 23:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779086256; x=1779691056; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cE+xwVdh3twnCV3V0E994pEurq17/WwBVoFWrClUTg=;
        b=LIuGWl79tg/jY9QT5GbT9KsUMaBpvEOBetbMWsDgW1A0rXbmvqPKzCuLlDizz78BOL
         2wof5+h21ew1nZU++aoKHtE/lDlE/ijaT2+ySH4Vj/9UOxHK2JXWKY+KZsAr9fHTr4A0
         UBoVE+oGumJuE0Qb0YjptzKghA9OF0fLbXV1LQSYrjrqkrvaVyAYovVjFsOi7rZqiu9q
         PSWCG44qL04jS022uCXJea8vYqK+iXrOBUjn5AP0vQaA5J7Pr5QuPGR6joEbjxg4uVe/
         OetYPMbazh/VzOKLjTlatS8hvOMerXLo0R+4dqXlSS1sKpl6Jk4AUWY2cZldkaBVfjdA
         BZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779086256; x=1779691056;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0cE+xwVdh3twnCV3V0E994pEurq17/WwBVoFWrClUTg=;
        b=lASHYo1Jt6b16pvYZVSp5M5SFPK/TfjwzZxzcXuyZkHYcocunU91YdvnVXu1bg7F3s
         uZ6/0O1S6R32X0ePN5x6964bw2h5gm67hxvjK3yQGIy6lYVzKSjQ849EkEMQFNOVns7m
         OkeUb2GOfYwLvDL7FAAGXuWfDAdXWsb39m/W0Cr9Vki0Ukl3M6/HcAwe6SA+4C3HTI1e
         OvM1hpBa4tQxNdJiEqunmiLv28Wc/FkAsmgD+SFChZpaH+8SEAG1xHiew/EhFlQ12SHE
         +SUR6dNgcrymxU7lQpqxAWToeMFgr67lbEOkUmkkFkS2RY/dERtog9RsDIPNR9goosl3
         qVFg==
X-Gm-Message-State: AOJu0Yx0VbSY1MdG8BfrHdJX+MNZmIud47+ymwNKIHLdS+UxPRJ9IBnJ
	m/3cpwPOssTQYBHZ2xzRwNG2ISxymMlEsU7U7MGgnP4Fk3e55TpIKUSTElyYVnHr
X-Gm-Gg: Acq92OGHh7wd1UBBSNq5B0JM8Mka3iSR7Fx5M0tkOh5XnRtQSzO9tqROjQF8qrNvrqb
	RYJ/mMw0Gpo6QQ57dpgXyaI3/5L/B8FFiXup0ryoMrB02GFYqKxpT3LHrioEpiY5huGX+A43/Wt
	H8kB3p6tyuce1PnqzmdJm22BbbISszPdOZJ66o+qQzKbTNWRq/kiGzau6ZygNcp517i2DTHXEF5
	5a33DWAfz3gwZtOzD1hKSZccPJc+2A78QDM+08ZSqWqJgBDgyNJh70qhbAo6GlhEI/m6WPeXWdz
	CtmiSeymcP0yptKoUa+eUreE4Ly+4LBSYg8PtolXtxhcA5VX2zUc3xWFrUQU9rHKkE+UmfdsKUE
	956bblIpmHAGvT6jFsf/izSkjWrmBBQe0Ep0SyxiPowIHyzK4Q4OIBIpscmXbeGW2GlUpZp/UnO
	y+PtjZSyEc0li+tzgD8ShSxu2uY8zf1zmrtw9Q2B8YzEp5FISiL39a/Q5FfFrOV6ksWIdWUatFv
	mS8L6VqgU92cRc1vobI0vpGYTsElaltP3aXGoirTNYnT7G3D9I=
X-Received: by 2002:a05:622a:a950:b0:50e:18f9:b5e2 with SMTP id d75a77b69052e-5164155c029mr175840921cf.6.1779086256196;
        Sun, 17 May 2026 23:37:36 -0700 (PDT)
Received: from localhost ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca360952f9sm46958916d6.15.2026.05.17.23.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2026 23:37:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 17 May 2026 23:37:33 -0700
Message-Id: <DILLFY3D4HQN.2KOV4CVPYXTV0@gmail.com>
Cc: <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: mtk-pmic-keys - use of_device_get_match_data()
From: "Rosen Penev" <rosenp@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Rosen Penev" <rosenp@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260518042046.981861-1-rosenp@gmail.com>
 <20260518043409.EC97EC2BCB7@smtp.kernel.org>
In-Reply-To: <20260518043409.EC97EC2BCB7@smtp.kernel.org>

On Sun May 17, 2026 at 9:34 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Missing NULL check for of_device_get_match_data() result leads t=
o NULL pointer dereference.
> - [High] Mismatch between child counting and iteration logic can cause ou=
t-of-bounds array accesses.
> --
>
> commit 0ee3fee49ccf02b7e629f90533e67fc9b40d2b9e
> Author: Rosen Penev <rosenp@gmail.com>
>
> Input: mtk-pmic-keys - use of_device_get_match_data()
>
> This commit simplifies the driver to fetch PMIC key register data directl=
y
> using of_device_get_match_data(). It also removes the unneeded of_device.=
h
> include.
>
>> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyb=
oard/mtk-pmic-keys.c
>> index c78d9f6d97c4f..fd684ac169386 100644
>> --- a/drivers/input/keyboard/mtk-pmic-keys.c
>> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> [ ... ]
>> @@ -342,7 +339,7 @@ static int mtk_pmic_keys_probe(struct platform_devic=
e *pdev)
>>
>>  	keys->dev =3D &pdev->dev;
>>  	keys->regmap =3D pmic_chip->regmap;
>> -	mtk_pmic_regs =3D of_id->data;
>> +	mtk_pmic_regs =3D of_device_get_match_data(&pdev->dev);
>
> While this isn't a new issue introduced by this patch, can mtk_pmic_regs =
be
> NULL here if the device is bound manually via sysfs without a matching
> device tree node?
>
> If mtk_pmic_regs is NULL, it appears it is unconditionally dereferenced
> later when calling mtk_pmic_keys_lp_reset_setup().
>
> Would it make sense to add a check for !mtk_pmic_regs right after fetchin=
g
> the match data?
No because every compatible has a non NULL data component.
>
>
> Also, while reviewing this probe function, I noticed another pre-existing
> issue further down:
>
> 	keycount =3D of_get_available_child_count(node);
> 	if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
> 	    keycount > ARRAY_SIZE(irqnames)) {
> 		dev_err(keys->dev, "too many keys defined (%d)\n", keycount);
> 		return -EINVAL;
> 	}
>
> 	for_each_child_of_node_scoped(node, child) {
> 		keys->keys[index].regs =3D &mtk_pmic_regs->keys_regs[index];
>
> Is there a mismatch between the child counting and iteration logic?
>
> The validation check uses of_get_available_child_count(), which ignores
> disabled nodes. But the loop uses for_each_child_of_node_scoped(), which
> iterates over all children, including disabled ones.
>
> If a disabled child node exists in the device tree alongside available on=
es,
> could the loop execute more times than the initial validation accounted f=
or?
> This might increment the index variable past the allocated array bounds,
> leading to out-of-bounds accesses on irqnames[] and keys->keys[].
>
> Would updating the loop to use for_each_available_child_of_node_scoped()
> prevent this?
Yes. Interesting that pre-existing issues are flagged...

