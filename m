Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84517257854
	for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 03:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786764017; cv=pass; b=dcCk1T5QGPYJDnXxvqlW6ziIRgmqUBA+Yun+RvlSc1mKp8n4JdtoywwfDOUoIOhSqmk7xrK8o6lQBgML9QzvHeuIWwJqxtILIiy3u692fzSCpVDobR5/k+k65FjG/MDGA31mX9MmRJwfoEMbmz7GejBRCsHPiu3bJ0knYtVVOw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786764017; c=relaxed/simple;
	bh=qvk4YjvniYtak+kXTfBaCRVIW+L/iNNu37Gor4R2CX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bbmzG+0vSUaLqvGV0Yze906lZP80A7KAIEWXBx+jJ61sK8TdQnmYrmhVHoNc21uRXeeecxnH4X7gjZjJWEYwyoJpw4yMGOFTYry7SjaUa8UrvytXkwUPnEzh7ZEBgkxqJV8aHx3GKj0RP1c7s3w1WUvE3M2l9FmqSfZ+4QcNwi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOZEjuQx; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOZEjuQx"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d01663d816so15256735ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 20:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786764016; cv=none;
        d=google.com; s=arc-20260327;
        b=LURCZeSgmmCZMnHdgWBEats4LB0mhBuwB60A+zARzmLpsKxTgbnTRNhqyGMHtTSo3i
         o2QYu1T+AM6jviYa1k62S8XkuJNxSREHbZUxBIV1ax2ovmjK7jWJFlfRIoeu8228ynFM
         vpSCW6SFXMV7KevsFTkdklBUqiCYihTiUiB1rUr8/vsdJWWsHvgSkplCYamk+JoKm07R
         aPD3u5yfRN/utKxcwW+iKxu0HL72ILq5uNc00conbLa7TZTbjDZvX1fqsVJusOZEG+x/
         QxcoR3amubKRhwuP7DLbU6cmttEsZwlAojg8OaPPbm3i0d0f1jWFEtCcGotxTgJwEKwa
         Ng3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qvk4YjvniYtak+kXTfBaCRVIW+L/iNNu37Gor4R2CX4=;
        fh=GJnPbtl+vSOzxR/1fEs1OZTrAmKtEW0RCoGgxPNOOJA=;
        b=kJKFYDFEMGuX9vwr6gsD+9/Jpg2Pp3hkKVW46ksn4KIAxVpX8fs1PJE/G7b0Lhnlsf
         FN/pwtXHkZkEGU2K5cltN1WH8P1spYRX4h2be+c4DkIPaP80dwQgLoDv3+BEgV9fLv7D
         6WKICTYpdShJTFpIdw/I4WRKd/qAbYuoFf35I7WTnMb6eRKOeQXDgIM+74ty29K1T7U2
         rPoN14QrsJbb4xu/PV/0Uta1IWs/BBUGqVrUiSbS4fXzRQX8PZWBUlwV/FIUuR0ZAuzd
         N5DD2PAvjNObCYeM6rAorSgmQF9kNCJimw6npL0uv8/qHuK0C33nw/XQDfSCP0gNW3FC
         xKFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786764016; x=1787368816; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qvk4YjvniYtak+kXTfBaCRVIW+L/iNNu37Gor4R2CX4=;
        b=mOZEjuQxf5qVvF4Xb9drwdpn+NejzIN150rt+XdNF8//SuBGMrgXKUSqffv6TO71Fe
         JS1cVHUVK3HaMUNLewOcNsXwC7eKDNMu6DvKCDzE4CjuNPc55M+Vx1D8WQNbRFeEI3KT
         mqnB/n0MnVz902ocwNbp0FOyxHBupoMbt9LBUccr2YWuucCdr9Uw//oRsDVpOfonfirn
         Oj9NF0qm+cDOSuj80/lKUj8tJacroztM+DHbPvVEQN24Fl5cUBX/eBq6RELKENoyQbK+
         GiOEA5xIlBo9Qu8JpBLGFNqRqs576+CL3Us1HFBsAOFK3VkYh6P/J3aV9XDlgoDFHffL
         B6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786764016; x=1787368816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvk4YjvniYtak+kXTfBaCRVIW+L/iNNu37Gor4R2CX4=;
        b=nHqajJ9BZtCabET9x7mETl0D+tANCtAzAlmH58IqeXjsFQ9DyW13LkbWAle5dLD/H6
         suCkJdINc7r65A8v6v49IIntQ8Pq7zAHQU0UyOrP6GI6Lfr6iA4K8kL70f3f/M2wo/rA
         fKhsTQxv7DCU4nzCr7l9+eGAbF5mQLBcpXuM1o9XKfooJ6Vj7zBuOdy9nJrdUL20b4Q0
         da9ypPCUEXHSMRHvt075zhHiXy2adY0oOrHxbJ3wMbH61dl7hcn1bBzFGpDpkMmSue82
         S87IX+Y1iqXaWuwMHBBptEqzj2EU2YwbjmMrKtcwiBrWgUKKYF4x2oWe0+iOc70ZXR8C
         9UHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaustQ3gNzhJK1Nfd9xLYeCkrAqtC9qjI0U2Ws/Jz83TikQPtGI9X9O7zv0yyRjUtv0cYaKVtHWu18oYdvT0w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyna99XRAB/ES+vlf3tQGLd6eNHbPjDRUaRNKpZB6xCZwxhq3aF
	cghArjspBcp6A9ttk0Qfixp/j8KMgkrICzsfcifhDGGt9TB4Je/iRRdxRVDxVGanYgqwQya8Uxu
	dysG7zQGVVsPsrpQKCIXgaktD4/Ntnac=
X-Gm-Gg: AR+sD11fegclzCdoJusJjn/m5ZjG6H6B3gSq9MBw/2W58oHNY/s0im9XkmOCN3uYgUV
	gUeSiuwGo5QQ/VC48S5ZYh94tHv/MiqXFMsp1Uav1CkHifIMG3EENCvvRMwiDuZr5GRsq1aZgk5
	HXvV5NVLuEsXu51mlVxGI0NBgArPjY3O3XbAXihfAFuGMoAs/1J1W6B2dbpApPIMFiexrjry4xK
	predIgJuWnUi+YStWK0SDlYgtst1XD0GWwBTYsFjw/tBdPOkPeJiaeg5mXr1nfffhX9Ln0vwn0Y
	0aGTRAsnli0A3O3CXEgDpYSqgnuowRb89D04wCo5IAhGajX3dJtfIX5bECAzUkt0CabRKKEn9hE
	qS07KGRRbQzUMB2H8ZX+elotF6vPVY0rQY8iU+GouDbHqGSPFSS6CvyS5yO+L4UlOkN8YToqTG1
	sbwYERt7TeN3DYdKk=
X-Received: by 2002:a17:903:22ca:b0:2b2:67ca:5ff9 with SMTP id
 d9443c01a7336-2d3b06e91c4mr122984055ad.0.1786764015675; Fri, 14 Aug 2026
 20:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814094211.25151-1-phucduc.bui@gmail.com> <20260814094211.25151-2-phucduc.bui@gmail.com>
 <20260814095120.235F21F000E9@smtp.kernel.org> <1jqzk1lz2g.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jqzk1lz2g.fsf@starbuckisacylon.baylibre.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 15 Aug 2026 10:20:04 +0700
X-Gm-Features: AUfX_mzRbh4hmvosuiLVlY3i6x4JnG5NEbKO-sUOdCn6SPRkXPqPXV4-RyM6Qsw
Message-ID: <CAABR9nHrxzkK+dR5ca9PxY5Psxm3NVsbpAwAfx=_FyH3q5zodw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card-utils: Drop redundant probe
 error messages
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
	neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jerome,

Thank you for the review.

> > Pre-existing issues:
> > - [High] Preexisting dangling pointer dereference (Use-After-Free) and
> > double-free in the `meson_card_reallocate_links()` error path.
> > --
> >
>
> Yeah, that was picked up before and it is related to the use of devm_.
> It is on my TODO list
>

Please take care of that when you have a chance.
For now, I=E2=80=99m focusing only on the issues I=E2=80=99ve identified.

Best regards,
Phuc
