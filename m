Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837170;
	b=k/Hft3LU41YJU2gT40yc4xpMHHhCF7JzVMEy4a/4l6DBudbE8mZTGl3me5UH89yDx3OQ
	 xtCe3QPN5S4i0RNlzE1xIOFAab3bZpCn/jvhMXt4nWWaot0Ew4CB6NBB9AWDlb/WQ3TZy
	 xfGzdfEG31Zr1J45OlBzHvU9l4vlLTwiKvPFUbouNYTV8P7acj4yv/+UC5IEtjfCV/lqA
	 vaSV+HyiN/e3DUbt6w2sj2WjciuZ6en8XiESWtoW01ib18Bt2CeOab4hOVEJAbTbSigyy
	 /V7LU090N5rixYWqRAklhwz6ahJioNCcRCG9msY3Hl0qYkRHbYQyQmy//JHdTUVWYjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837170;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=kItaQQWrnsLmpfYQZnmo5ZKiXXzLU/di5P/nGlEMeeU=;
	b=niG/+3mCu/Jwt4k9Z+Q2XbU7DENNKW1UsTQzUkCxdhwRS26LkSHdtGPAChZYN/VHH0U8
	 X+v+QCqriS7j1z9vSITCLVz9k3NNTR8VTQVjHOjZRmjgMhlM232BOcVwjSkhoDjcDNETi
	 ZdlKCAEX/aYyKiU3ueUDETTSuXxK158i4ntleDWPFQDpE6oedVwrHBBrhPj3ch4oOGfU+
	 iLakvOod1Z7GJtatM3BJEypSc+Aj6i54uqPDKhX9g2Gjnjbtl5hW4DnUfjq5VKk3yoRPv
	 PXcEmne0I/3uC1WhKr/Wri8rTnhLUjSenEIL5ZrlIQlM64LoxzR0HIIf9AkMPFp03CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=p22FMlTG;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23BB606A329;
	Mon, 16 Nov 2026 13:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F23BB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=p22FMlTG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9FFA01A168D;
	Mon, 16 Nov 2026 13:52:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DD936023F;
	Mon, 16 Nov 2026 13:52:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A21C11BC051A;
	Mon, 16 Nov 2026 14:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kItaQQWrnsLmpfYQZnmo5ZKiXXzLU/di5P/nGlEMeeU=;
	b=p22FMlTGS83GiD4ReWdtyZdg8MKbu7uh94nYkuVts6IkcBtP2fWLcHhnSCwAXjAxfltMB+
	DJN/G2iok11zFHQ0icO+riMgR0dtWZMMZTjCco5ac/7fB+3KfRR1WAhv1spJauE3/RSFip
	y/p8h0El8GcLHOurQFRaw8QZwk03lZlI5DX0lQYXvylYbmZmdoIm8WNO1JrXPElG3Ovog7
	vx2QCUOLuexHBng2MTzRVTzMZFFNH1chgnwtAvHVdNiCZoefi33/iS0sgHvJJpxRXdCTxw
	HnO1JPIfYNBt3md2EqSf5CKZ0ZqnThr+xCy2b9bJbeuxa9gct7Mo3wlzD9VQ4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Samarth Narang" <samarth.colleges@gmail.com>,  "Han Xu"
 <han.xu@nxp.com>,  "Vignesh Raghavendra" <vigneshr@ti.com>,
  sashiko-reviews@lists.linux.dev,  "Richard Weinberger" <richard@nod.at>,
  imx@lists.linux.dev,  linux-mtd@lists.infradead.org,  Frank.Li@kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: gpmi: terminate the DMA chain on
 completion timeout
In-Reply-To: <sashiko-outbox-191156@kernel.org> (sashiko-bot@kernel.org's
	message of "Fri, 30 Oct 2026 15:20:32 +0000")
References: <20261030150929.2944717-1-samarth.colleges@gmail.com>
	<sashiko-outbox-191156@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 14:52:44 +0100
Message-ID: <87pkw4sx1v.fsf@bootlin.com>
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

On 30/10/2026 at 15:20:32 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] mtd: rawnand: gpmi: unsynchronized DMA termination in
> gpmi_nfc_exec_op()

Sashiko complaint looks legitimate, since you haven't actually run into
that problem, I believe the fix is incorrect on this platform and
therefore a DMA patch must be sent first. I will drop this patch, please
resend once the DMA part fixed.

Thanks,
Miqu=C3=A8l
