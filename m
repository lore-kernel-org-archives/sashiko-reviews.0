Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793983718;
	b=fcQ9mti+0x8k4X8LaR/hsSIj1K+Uo1/qsYmynz4Bv/ww1sg9s9IN3ZWUYnCQ6hRlb1Vo
	 H+s6QSvX276sTq7Kw2BPfm0rhZ3QTmqPz2nSjMYrcUcutiu6fpEbwx4aJEc85GZ7/Ceua
	 UsIfJTue906vQFYTgv6/spdRGvg8SRanMjklpqXlCGoMIRcGSnceNN4mv8LNPIch5PUkH
	 B+ZltVaZB13SBfIEnc5cuhP1nAjpTl7PVq0wHNWP7hzUF6uoOHVG8wqWR+XhCALg4Y4uu
	 UMn10Ylc0bI8Phm5DStQEqI8dS0UR5FgzekP3U6ScKd3X7O/MHOS/HZ8+cqIDNeVLMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983718;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:From:
	 Subject:Cc:X-Mailer:References:In-Reply-To:
	 X-Last-TLS-Session-Version;
	bh=Y8RHb1CfLtWSMwWuWLOraHpFqxPeL8G+wZwgLGf7N9E=;
	b=Jy63oz6Q6jDXgxGkOzHsmUfneRByZHK7zjTn8rgPppr9Q1Tqn2GXulh1lCNB5QhLvY+j
	 Nhpz9M8GzMBOdYJAEwGNApJvEFXzavMF6p6vUvpItTtvYu1U1MkWf1K/YWxSqH4WnF68o
	 snwVtuFKGr7h4U97qJtDQlHBbmdY3DCIocYoPWrcDFcscdAdUjBKPyexGEtMfKi7Kd8oh
	 RdXvQ7PSyekaFKXYfev/xzuNg4fgnE17hG4wU6bLX4vZIqFWF01O9IfNmLCB2fS3Tf3/b
	 pTFUAKzBYxu+m190fx6HzTuwLBFeyX7p/Zu14H0zxmglwKje4igGkEHYntHQ3ayZKSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qUzQmsz0;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6B606A326
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 16:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91E6B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qUzQmsz0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0BC781A14F1
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 16:48:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE8FB5FFBC;
	Fri,  6 Nov 2026 16:48:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1AC4103291BA;
	Fri,  6 Nov 2026 17:48:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793983710; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y8RHb1CfLtWSMwWuWLOraHpFqxPeL8G+wZwgLGf7N9E=;
	b=qUzQmsz0d2Ruw1AEvHRBCM6BqbLlBirANyZbJZhH5UCMmroQKt8ux4U5yrHguJyy2mwmS2
	T6hnRhD62dryt3BeJMMMww/aeVKq8LTme+CYkYuHnSZYrE0hw5R3NsNJLRlqCdfFUFk7la
	7qvmaDf0jQgb//keb3vqou8pPTRAtYOiBHZ0LoWQqdfuaIAiCtGVXX8C+Da3y14mNlMCN4
	UBzeUB/ko/QvbdoILgKKtrSzjjwMlT+4kEhtxUBxuUf/ktNDFdhApidVMmOBJagy806Me0
	YBQZpCqkoc/UaeXEHZgs+7PxBvp0+ZN21kL7hzzS8F6HdSL0YxtmHfTpZZ7yOw==
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 17:48:28 +0100
Message-Id: <DMOA5EDDS1AS.39CGS8Y3PNPMW@bootlin.com>
To: <sashiko-reviews@lists.linux.dev>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 2/3] drm/panel: remove drmm_of_get_bridge()
Cc: <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-0-c0ea3382b798@bootlin.com> <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-2-c0ea3382b798@bootlin.com> <sashiko-outbox-201829@kernel.org>
In-Reply-To: <sashiko-outbox-201829@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Nov 6, 2026 at 5:35 PM CET, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] drm/panel: build failure in vc4 driver after removing
>   drmm_of_get_bridge()
> --
>
> commit 4e516e61e060977ea843a480424ba4b15e3d19c9
> Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> drm/panel: remove drmm_of_get_bridge()
>
> This commit removes the deprecated drmm_of_get_bridge() helper and its
> header declarations.

[...]

> [Severity: High]
> Does removing drmm_of_get_bridge() break building the vc4 driver?
> vc4_dpi_init_bridge() in drivers/gpu/drm/vc4/vc4_dpi.c and vc4_dsi_bind()
> in drivers/gpu/drm/vc4/vc4_dsi.c still call
> drmm_of_get_bridge(drm, dev->of_node, 0, 0).

Nope, the calls in drivers/gpu/drm/vc4/ have been removed, committed
earlied today on drm-misc-next:

https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5c18e4b11829d922851=
0d9580027598b54d382e7
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4a38a538775e072fee7=
07aa28aea5ccd50941796

So patch 1 of this seris removes the only remaining user in drm-misc-next.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
