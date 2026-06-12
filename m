Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC123A984F
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 09:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255563; cv=none; b=lkP6KWulrSlIhfhCRfFYFT+sKJeq0asqpVsrW20MYL3g+trlOZFPBR4l21E8AY/dlMevzQQcouC904stGKZYwp17cDFtiFD9qbJ+dWC4gT67mfPlX5qpf9d0HBEnKYlKxPO9HQi1VPbbdFsIveaVyzbTqo8N6AWxwChMZpKIRQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255563; c=relaxed/simple;
	bh=1HCoYNc9EFQ9bD7/s0YtQxxzTBD+HBwHfkCtwJ6rJOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BtuGppsyDHAJem9HHpwlfBL5ESnkF141UW1rHIEbNDEy/+1l2k4t34k4n6+Hpezm6blGDS9RQdAzQ4am8JgjuUt+pyuJdHZENb9GFlR933GZmIpPI0mu9v4SQZzalXF9silKixWpP1wa92fC1ShrH6ystzQXKiAgjiPoQT74F2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vfKYl1DN; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vfKYl1DN"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 242F01A38DB
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 09:12:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4CDE60012;
	Fri, 12 Jun 2026 09:12:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E39D7106C85E9;
	Fri, 12 Jun 2026 11:12:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781255558; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iJsXIUmNuUrMOCYzCyh+b1++3mAcfI+RsbdQDmpTny8=;
	b=vfKYl1DNzHdqIDMbfa1G+i2dG6dAvKJcebWjot5aLRLnAd/K4uoAHVzo68246agxI10Z+R
	iMuFWwaAY/dcG1o/5QUnvsBN0DzUEQbVtK6zseXCYfzJL2TDg3GAL9FFip+1NG2yh3QIPR
	B51gO6Npe9PdlmMuejDHsFghRRfqkZX9jsMS+cW2D129gwboiBJVFVlMx7mrveyz7kqPrI
	ykMXhodfEngXrTHur7IU7UNR47c5itOvhLNIRhV2l+f6G1IclKaYwGuevIKQejVtEMjFPM
	EdLb4mvRGHYjnHBv4v1QRGLUpZxst5QgquTjUBW61+3sImg0Q8oXQKSCZzo1WA==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v8 7/9] clk: eyeq: Convert clocks declaration to eqc_clock
Date: Fri, 12 Jun 2026 11:12:37 +0200
Message-ID: <zdUBjycYR5WQkKpxC-LIgA@bootlin.com>
In-Reply-To: <20260604134458.F1C311F00893@smtp.kernel.org>
References:
 <20260604-clk-eyeq7-v8-7-53f618174cf6@bootlin.com>
 <20260604134458.F1C311F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Thursday, 4 June 2026 at 15:44:58 CEST, sashiko-bot@kernel.org wrote:
> [Severity: High]
> This isn't a bug introduced by this patch, but since both "div-ospi-ref" =
and
> "div-ospi-sys" share the same hardware register at 0x090, does this need a
> spinlock?
>=20
> Looking at eqc_probe_divider() in drivers/clk/clk-eyeq.c, it passes a NULL
> spinlock argument to clk_hw_register_divider_table_parent_data():
>=20
> drivers/clk/clk-eyeq.c:eqc_probe_divider() {
>         ...
>         hw =3D clk_hw_register_divider_table_parent_data(dev, clk->name,
>                         &parent_data, 0, base + clk->div.reg, clk->div.sh=
ift,
>                         clk->div.width, clk->div.flags, clk->div.table, N=
ULL);
>         ...
> }
>=20
> Will concurrent rate changes via clk_set_rate() execute unprotected
> read-modify-write cycles on this shared register and cause register corru=
ption?
>=20
See my reply to the previous patch of the series.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



