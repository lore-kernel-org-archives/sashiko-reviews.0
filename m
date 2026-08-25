Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ABC401A08
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659929; cv=pass; b=ARhD4ACpqhpgYXMUGtH9R0gTAkmjulQ5/wNdZfxn4vkxDCcMubGOADG2SvgStjjhKZTIaDQ7grcmHJWhoGmorE/79fsosM8JuAI0+lFT9PKV00MsisoOKKUT1iVmbZZJcJ/4OQrS2cgWoCOtDCq3B32QufDH7CjL52DXbqTNSUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659929; c=relaxed/simple;
	bh=HlEC2+CSDfjaRUFWnIqFET2gLvLHwOVvQtLYhsPMdyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUINyMG2X/azigCFYBCBjkKurVomoHdbZEQBL7kx6NhTa5u2aPc5ugQv4QDZmBBw8mWIU2lsUr2L6d3gVt3oM8jjqjTpFI7mckG3CaQnQCJ/QgAj0rfZoNsLJJXKPFGPAlMrb4tTN69v20F+iYjgSASRmuWfdbJeVHRFkhmaHV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UljSEGfE; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UljSEGfE"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-836c718715fso44425397b3.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787659927; cv=none;
        d=google.com; s=arc-20260327;
        b=N+U3XG3/wE9o9AuTrOM3EohHqoLx/j6dYQivz+4ucy2FOK1oeDYV7sFVfHpHG2QbM9
         i7kltfEUGDGQmwyWaa5wFggfDILcDSm7pQ1xAnKgBC81CIDhA0G8o5VFogIendxTD+Z9
         xA+zcDiR4ofPRbQMtsVoV3JdsC6tHRBQB9vu85JsfILeZ/rCsiQeLq6hgbnfpWf7/yu7
         BPL55/6XxRK0AToKOAm6x7weiBgNewFi7gtpHxtFaWv5fBS0BZRBk8DZxFoGfGoVl8X9
         j9pWyEG96vF66mTD4mf4RAH4fQGXJcojY/hO6FafzKHlElLXHRivgtBQrjtDfUHyqMVN
         C5qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HlEC2+CSDfjaRUFWnIqFET2gLvLHwOVvQtLYhsPMdyE=;
        fh=vjDISns8daAkHmvl6VSCSjdAaBCXdBJt5xWMZnPN5n0=;
        b=L0EDCv84Pv2Hcrd0bTTFx0EnuznLCQ/yoZyuTflicSSxf+08xidURU92owStoC0hUM
         oOwbrIKwKWZ/Zw5G/OoCKBXtPH+ndUxF+kF/ejIH0cGTcY/uW9s7pKGPXeEXWVtAr65m
         6dQPSZI7s1DD9dPYBVNBs2cz3nqdhtnvhZ3BySDBEZy/tms78hWGntjUHJMMrGX1Dupp
         hDigo3UJq7nHA59hi6Dunp/DQ8SCc2s5DbV1XF3oHIQI0DlI9+iQbo0NXWKBGHSMk22I
         vlIZ81rk+XLezN72/UR598cGXp+ZYqcpoaG/036Bs7Q61fhxqYA6cCJwYR7tKfrx8qeu
         2ovQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787659927; x=1788264727; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HlEC2+CSDfjaRUFWnIqFET2gLvLHwOVvQtLYhsPMdyE=;
        b=UljSEGfExirWz/Y949RNzH6fu3Tah8kuPOYgLm/5Ygey9utj0ueS8ZGvky/mUb+L95
         TI41k6NrpQX9GALxjtqH+pfCvdq813XqdhRGcUtb4Y141lithAcizzWAgrWNE7CvzHYG
         fh1anS3Lxrea2bCyFz+O27ms4IQKENDI9ajCQog+A7EK0hu+MnMi87c4sy8K88lazcWS
         WNGNjH7EmgBAu3h/OjrLDxM3GrzCbJxFMcb2Dtf3+dLAZBlrUFLalBm/GDZnwWFJOfHh
         DWsEKapLYqp/yBI5WT8dVxObliLspvPwOtxRAMmtfJoCJ4j7pYU6JVMKNZWoDB2MaDhH
         2Lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659927; x=1788264727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlEC2+CSDfjaRUFWnIqFET2gLvLHwOVvQtLYhsPMdyE=;
        b=nGc4x19TV36Pns8gw1FnU9vcgjuP7vJGA9S/qBCEdErT3eMxCt8bdc56NlTE3qvjuz
         En1gYYS/Lyzae8GELjnoUyqOWPWGP47gvpliRYJdqVmKeDvcG78mUFEJuilA66doahYu
         QaJNRv84VjZ+OCaqFnDHO9ZgGlk4yNsU5k/cskXlGo0mdl4TIXM9rrFZpPDkgUCQC8s0
         1bsjaJ0FO3KNJakC+M5+9m0v2+1T/mzA8/rEmL4jTNKDyVucMzIfqFOee9Szyc1RSCVc
         KSGZ9i9HFz9ET9VJYqgdkNfo5cWnUJP8Vigzr4pvVNHcM9B45UrMmG0jUufpDOZ74uYB
         y4zA==
X-Gm-Message-State: AFuF++nnFkcCPfp7U/cdr+J9WYRzhvpkxwTHlIKMQWpd1PcRWB1qJyMt
	BfrXsy1jPx8YFJo+kLtiFQ6zY1REh163dZseVFbLxPkzhFl1Pg9miqcEdvgGQQRJt9pEmjhICnx
	UaUZ2Fa1vQVSpiPM6BPRdqnUJ1HGbJMKRhMRo
X-Gm-Gg: AR+sD12TNO0zstx6yt/Ns3VFUr/eGlqkxXHe72SREPS1s/PIuplxVnDE9bo4yiKQjZe
	5UUXl1xf7iOQJjI0nzHUxmiQPcCmAElVCIA0ysr4B7h8KlIAGZP6d8uhzSki64bLgu4AEvDh/h5
	TLlL0MwHGJx7TlJ6d63q0xXwn3lKDYzdY2skcYDx6XVy0sjBf9gIdxgof0MXJKB3gCjiWO8FJlN
	aTCQG56V9hjpVMHvol3uzy6+pPY+Pnu/hA+FsoLhC3EO+TZFJ2EDa1u4pYoBdaLfCYnwD84iSBl
	19v+fxEIWgD1VFQb0b7sDkKH+f+pNv9HTc8BEoKTWw82vlTkMMQXKcBF0DEt38IUibiMUkLqpjD
	J1Q==
X-Received: by 2002:a05:690c:386:b0:81e:8e36:e98c with SMTP id
 00721157ae682-8546c2dbe02mr24868467b3.0.1787659927127; Tue, 25 Aug 2026
 05:12:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260825114641.80452-1-laoar.shao@gmail.com> <20260825114641.80452-3-laoar.shao@gmail.com>
 <20260825120608.BAB401F00A3A@smtp.kernel.org>
In-Reply-To: <20260825120608.BAB401F00A3A@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 25 Aug 2026 20:11:30 +0800
X-Gm-Features: AcwNN1VfpEpkFOLcFbdKAaz-F0Fcq7g8jZW7XDimNxbUGqWds47h2Da3KTPOYnk
Message-ID: <CALOAHbDO-Qw+9j2vX9hSgWxxCHXGGt8qF6h1NDqQvE5a9wg31A@mail.gmail.com>
Subject: Re: [PATCH v7 for-next 2/8] livepatch: Call klp_init_patch_early() earlier
To: sashiko-reviews@lists.linux.dev
Cc: pmladek@suse.com, jpoimboe@kernel.org, song@kernel.org, jikos@kernel.org, 
	mbenes@suse.cz, joe.lawrence@redhat.com, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 8:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Potential use-after-free of kobject delayed work structs during =
error cleanup if CONFIG_DEBUG_KOBJECT_RELEASE is enabled.

Seems you didn't read the "Notes for sashiko-bot" carefully ;)


--
Regards
Yafang
