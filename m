Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890763BBFD3
	for <sashiko-reviews@lists.linux.dev>; Sat,  3 Oct 2026 09:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019527; cv=pass; b=OPNJyc2f6y06AsjEfqi1LAOaD4mtHsACg27FHekh99vOsaOxhYDMF5NNm/oBhz9HF6euz0zLdapsH3fFe1VRF2wV676o1XujH08wbI7lHtPuK1Oax3HwTiU2e4zoWLrdiuxs8wj/KMDowqAOpnDRMBdvANVDO1+qQ9LBalgfFig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019527; c=relaxed/simple;
	bh=x9/9E3ufoV6jMPYJqbetP5DjLiiHxkuNm+gHzjxFZbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cgla4fhu59HtNKsAOCUXJ1Cfg0pUrpYa/DRDBxpm/c1wk8A7ikQPgcVYXya0wIc+XISyXJIiCGg+09VQfmeImpl24H1KK9qNSck6G9jocGVRdP19TbRZEzhfEXOd/Y3AUE71KS1IsS2mwYTEB1cuZh3cl2Kea1KF1yCVUisusvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTmEYvMl; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTmEYvMl"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a49e560a98so1196151fa.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 03 Oct 2026 02:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791019523; cv=none;
        d=google.com; s=arc-20260327;
        b=XCQXVunX8aTRq1V8KlUOpMkXpAr6reJXmkqt8MU05g1DBmxaY/M0X7ipntI/Rd5Of2
         8A50IHhWBtT8uMTTgAgz7PLPEPGx9tXrMquWZJrkKNMbLgjUMnEBSpM8ghM3WfZqGn3D
         mlfmt2G7W/WNlBn9NjFwGE+PB3eJIhy6nECkleF2V3I+2yq0SWk/9sk9dzxvz74bMhki
         D+QEpEupLjzRA4tCbrB5zZRWZuV24DZ4xhgRHO80wCjlBu/hxF5NtemReZ38WplfUXZb
         aIMFeeotjoYUr6sBUA3e1WWnB6IDFT43Y0qBbZErL55EhzpJP75dvlrlsw/oSiBvuBKo
         Tomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x9/9E3ufoV6jMPYJqbetP5DjLiiHxkuNm+gHzjxFZbg=;
        fh=78M6W2ajC7hAUoWm8eU9pszO3wS4ShfktCfjUn6Dy1g=;
        b=jqUV7fCx7u1sdhZCujtGrr6pdmJSLq6NHdOyrPVC06pm6qQndT7kHsdPseTOW1f+5s
         K7BjH0Z7iCmyZlMz5FbEuvM0ZHjqJfGMZA2h+O8jargNhcAMCQxZT80fmQzb3RhM7IR8
         forzuUi6qRzpwaFeGWSPBzayHUUJVFnJbNmsk84fM331RicJR/9D6UlocwM8A73ZcC23
         j+wi0iGdHV+cR2OMfqoWPquXU9JezOtT7bqlhDFrq6GNkIPHCZWWAEvXAH4UJGkV8J30
         zMUcrxre0qaZ/MY3U3vsOhtBP40SFyniUBvehaVOTexJaSoX8aZ58exm6L0j9DTngVjk
         I5NA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791019523; x=1791624323; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9/9E3ufoV6jMPYJqbetP5DjLiiHxkuNm+gHzjxFZbg=;
        b=iTmEYvMlqgXrtDfxRV54rGkBEoC1tPQg//ONoQ3WdLafW5qlCD9hID/1ZjgKZb2Hh/
         dyqYXjrj3XRaB1UarKrSsGsAWy2p+yorulMpserjP/ki0TIubR/8Zbk6B9v45pxf/S8u
         F5pbhHSmt7CEa30s+Pz9/vkc6PzoA1kV4bU2GFEjJ1jnsfGUXsviWr3e+SwWB5xe70V3
         j/byqhZkodAI3rOy5q1SN/2CM7WhTPVLs3X0XNkHubURydqGe2SzYi4t3fLH7tUqpBEV
         nlZkmHaSGEWeNsqi4aTNZx/0VaWZ/Ju24tSLhU++ojo8bsPKLzLIhA0YgRlxH6H7Z94J
         pJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791019523; x=1791624323;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x9/9E3ufoV6jMPYJqbetP5DjLiiHxkuNm+gHzjxFZbg=;
        b=gZ38mhFBcYH34WoDhMLsFoh4jtOxQZnMOyeSIPyMMwv4CwOYgYSB6dcyJ2+fJaA2O/
         sub+nYQZLSQQsoFiwz5RXph+S4izzYc9w9rcBCCDptaesuBSnMM278e4z9fQ7fGZh3pj
         HqVLi0StMnmDgh9DJfRzLC7z33/z5OLxcdbnzRvcNxUwzmod4QxcxPunEsjw19iGOAba
         7+hVbZB0jbS7KvZgBaPW0ijy0O/lXuh0bF6GwXuUsLYfN2a2uwlg2ExO4x+pU+RWrxw+
         fEWDPyRoflioVWb1iE8V+u7HKXCqsyy/C+T+WiBIFE6b33Yp/TwQ9Y8q8Q4JeGu498yi
         GZXQ==
X-Gm-Message-State: AFq9FYK2TkXGnY2uPcUk1USE1tZaFMBZKSNSlb0XmcsPHcSz5xuphOO0
	Kjt1q7zdXRbW85zUhRlEHUNpVxzdYicpMaXWfK9CCGtCkQ28MCRoglMLlYlXoW7lq60o55XuTp0
	bonPxDdQwzvjKgCZ/FUe9dVxq8WgYvIysVfAc
X-Gm-Gg: AYBFou1MzKMw8xh6tXlHG6RXH+XTBiQIAVsgjzvozD0KAS4KDlFyUo+9ZadiEoVsOEq
	KWwUHXfmlGqENBQocqCx1zh5SWZRVPteWnFn8um9piairk2c8CZg1ZXHdaVjxm0RjcrOlhMs02u
	vjhtPI4htp7s/E/hAn1RR7ZeKEwDOnrbd6qpkAD+VKtYQr86uBeRz3uSz2E/DphRMqi3l4ERa6A
	muyULJOBs3AY6NZPbqvM3XBQIuci9vSrFaIYzGVEoRnQN/U039Op9sXl8wSfQh/CRFafzUBrKpM
	U98IELqgPtlh3jQW84unFTYDFbE+gugRhQcPeLqSR3Dic6E4oUxdzY9bO5x0QyHdiYmHF8iCav1
	wQ+6mj0Z+G6Ra+Mx3YUy9y0BzJWmR6tGMT0ih
X-Received: by 2002:a05:6512:4011:b0:5b8:ef9a:40ba with SMTP id
 2adb3069b0e04-5bb9bb1132dmr1845311e87.4.1791019523088; Sat, 03 Oct 2026
 02:25:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003084627.353899-1-chenyou910331@gmail.com>
 <20261003084627.353899-3-chenyou910331@gmail.com> <20261003085118.1D0351F0089B@smtp.kernel.org>
In-Reply-To: <20261003085118.1D0351F0089B@smtp.kernel.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 3 Oct 2026 17:25:11 +0800
X-Gm-Features: AclHuK-ZzjOilMOUUbSeHgJLk7Cfv53pwgUKF_b_qOYPJ-oKX0eccz27j7k28dQ
Message-ID: <CAKspUh+qp3rVdO51fBFdmKZd-jifHp+47-u6EbFgZtE392eWKA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
To: sashiko-reviews@lists.linux.dev
Cc: Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 03, 2026 at 08:51:17AM +0000, sashiko-bot@kernel.org wrote:
> The commit message states "Rename the node to ethernet-phy@1", but the code
> only changes the unit address from "phy@0" to "phy@1", omitting the
> "ethernet-" prefix.

Right, the description and the change disagree, and ethernet-phy@1 is
the intended name: it is the generic node name for an Ethernet PHY, and
it also brings the node under ethernet-phy.yaml, which phy@1 skips.

I will rename it to ethernet-phy@1 in v3. The internal_ephy label is
unchanged, so the phy-handle reference in gmac0 is unaffected.

Inochi: the only change to this patch is the node name, so I intend to
keep your Reviewed-by for v3 -- let me know if you would rather look at
it again.

Thanks,
Chen-Yu
