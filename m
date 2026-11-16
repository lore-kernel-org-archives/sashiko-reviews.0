Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840377;
	b=dPRBuQqo9CrjQCNeSOkL08Ho/jprNY/sZuOQFOPS/suiYW6IqN8JdfGOV4vazaP7EYS6
	 PKjRb4IiFjx88lVx92U3bb/52dfC9SAl1CewaXI6ylgjF+FYvcGVEp+EEtdtE5f8A66dg
	 Uu0QCL33ZauVMvvB+/lVVJkWwEu3NCy5h9w7Mlrd9TavzQCrqTbuby2ZYZQuBjOK8GWzz
	 eVTMljQ87iM2LnxKJTc9W3MYk+eqBAXZkxIPGPD7nt7uxfUyEdUOcNHQNtjjG3YCgEasF
	 ju0yPFUXHNrDEwrp5c+r+MuGng+ETiE/sBBVPTYeiVExLMxp5BiRcIeCnfUICKC9i8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840377;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=FeipBFfhGUrMTKnujrvxDjavPU7yfgD2WlGNa9kNguw=;
	b=T3QN5BXfB1LFz0VY+HMyt04wE9U2DONA4pPIWWgoQuEqWzt5BHEf3CVwIflmHKv8dNC7
	 wKOv0w17E60BaOk2WRmydpAOmXq/bvwPlfza42g/n6wRqEate4qWqRWat1MKbDezLXicA
	 ciCOnJKPQ1wtUEd0cUqE0NYNioFISUIOEGNuxou6FRRj71ToBIKhncm97zISkhtYVHIWJ
	 /k7+6XoxojD4w3HNoQ235BZzku+MDQzUTmMgMS6JRQtEK85/NZjCR3OBJ4KRY9hyYrI4O
	 SEofwc81oDtLDZngCHuHqGDNyL85K+DG0Tn10W+Ff11tJiVweeR6ognMfTKhhoqa07g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DnkCEYsm;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B33606A333;
	Mon, 16 Nov 2026 14:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B33606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DnkCEYsm
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 12484C4EFD7;
	Mon, 16 Nov 2026 14:46:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 05A116023F;
	Mon, 16 Nov 2026 14:46:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CCE0B11BC1D59;
	Mon, 16 Nov 2026 15:45:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794840372; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FeipBFfhGUrMTKnujrvxDjavPU7yfgD2WlGNa9kNguw=;
	b=DnkCEYsmhyrHl8FqobFTXDmDzhl/fQVyzgPFYqGeJ/pzGE8yt5iPxVrWFIUIkbforPsa4l
	GaGpgOWSSm/5ZPK9XXRRoE3Uzk1PTzQ3/Pl07rFQN32NFyx83oX6jA8Axf1MrenlwLmqB0
	v05puuobZikiVJ4K9QJYcQP8zzJ/6YXEJADgxLA4TEukf5FZtnlWK+OgZOm7+PXtlGzOgK
	9EFUd0wgr/lY4Vwt2puSTRk6hqt69U3AAzfchzLqnu+ErLxLhBPQhnwVpVW2wqIAWS7wXg
	55f1sMKf9JvHcpcRN3sG3ZMd1Zaov8cANlYB99R/KUjmp6AexywEIBlsdBsnEQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: Frank.Li@oss.nxp.com,  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Tudor
 Ambarus" <tudor.ambarus@linaro.org>,  "Richard Weinberger"
 <richard@nod.at>,  "Kyungmin Park" <kyungmin.park@samsung.com>,  "Nicolas
 Ferre" <nicolas.ferre@microchip.com>,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Han Xu" <han.xu@nxp.com>,  "Keguang Zhang"
 <keguang.zhang@gmail.com>,  "Vladimir Zapolskiy" <vz@mleia.com>,  "Piotr
 Wojtaszczyk" <piotr.wojtaszczyk@timesys.com>,  "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>,  "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>,  "Rosen Penev" <rosenp@gmail.com>,  "Frank
 Li" <Frank.Li@nxp.com>,  "Wentao Liang" <vulab@iscas.ac.cn>,  Rob Herring
 (Arm) <robh@kernel.org>,  "Alok Tiwari" <alok.a.tiwari@oracle.com>,  "Chen
 Ni" <nichen@iscas.ac.cn>,  "Runyu Xiao" <runyu.xiao@seu.edu.cn>,  "Hemanth
 Selam" <hemanth.selam@gmail.com>,  "Pengpeng Hou" <pengpeng@iscas.ac.cn>,
  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= (The Capable Hub)
 <u.kleine-koenig@baylibre.com>,
  "Triet Hoang" <triet.hoang.dev@gmail.com>,  open list:HYPERBUS SUPPORT
 <linux-mtd@lists.infradead.org>,  open list:FREESCALE GPMI NAND DRIVER
 <imx@lists.linux.dev>,  moderated list:ARM/STM32 ARCHITECTURE
 <linux-stm32@st-md-mailman.stormreply.com>,
  sashiko-reviews@lists.linux.dev,  vkoul@kernel.org,  Frank.Li@kernel.org
Subject: Re: [PATCH 1/1] mtd: use dmaengine_desc_set_callback()
In-Reply-To: <sashiko-outbox-193928@kernel.org> (sashiko-bot@kernel.org's
	message of "Mon, 02 Nov 2026 18:21:00 +0000")
References: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
	<sashiko-outbox-193928@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 15:45:53 +0100
Message-ID: <87wlqcrg0u.fsf@bootlin.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Frank!

On 02/11/2026 at 18:21:00 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] mtd: implicit declaration of dmaengine_desc_set_callback()
> breaks build

Should this land after DMA core changes have been merged? I have too
many patches in my inbox atm, so I will drop this one, please re-send it
whenever it can be applied and I will happily take it (with the commit
log fixed).

> - [Low] mtd: commit message inaccurately states change is across sound
> drivers

:-)

Cheers,
Miqu=C3=A8l
