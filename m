Received: from calculus.sigma-star.at (calculus.sigma-star.at [188.245.196.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9432C35C6B7
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 06:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.196.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790923792; cv=none; b=AlfvFepJuuw698UUA+gvaj7jzzSjXNd3hKDBualOqEPZ3XI5IKv/+7ET+0d8xMD0mkSX2vhrS41B1zUSfp5FG0j7TyEkQ2BW+PKD4DlIE7CIf4TTGhk92+PbTi2xnqcwspSA4bDRi6K6bF7r+SDmIoujdPm2bR4TuAdvPExFQrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790923792; c=relaxed/simple;
	bh=wHuTCO3Jc8e6MPxkCVOYFT+fxRijmIByOGGlSNjEg4g=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=pTGQOuZCZD3cS7umoQ5Q9tqPl9L9yQKWO217ROdFe67WYh3m/9DVBBJpwaKLiiCkEpH+ZnBkTSvpAf6yAxP3tPYDyhdFe8v7p71cokioU6hCoFgCzj06b0yISlMX6QSarqJe3NAOqQRm7qP8+4MM5ATqg+qmRdW4BBfjKg+Kcgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b=HF5y9sLU; dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b=TVqZw9qf; arc=none smtp.client-ip=188.245.196.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=nod.at header.i=@nod.at header.b="HF5y9sLU";
	dkim=pass (2048-bit key) header.d=nod.at header.i=@nod.at header.b="TVqZw9qf"
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1790923727; bh=wHuTCO3Jc8e6MPxkCVOYFT+
	fxRijmIByOGGlSNjEg4g=; b=HF5y9sLUwTHQhsdnolTtefKw1Zr51LcKQoFf4522gqzDAqn3xm
	jrd8u+ViU6afbTKAqbUlFpGgunxuKhmohBDg==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1790923727; bh=wHuTCO3Jc8e6MPxkCVOYFT+
	fxRijmIByOGGlSNjEg4g=; b=TVqZw9qfxzLON+ZTDG2s/RE0X4RroB1wP5TradoASdWUlw09Qv
	b8Oxh6ZMDHgbEpBtV6xEpFPNIxtDvI+IrIYKmWVbJlCJcHy5zF/FYjQFVE7J0rud/eSa58XNfF5
	nfKijqqZIhsjYvB+4yAjpT4ckz/onOMqYY7MnzkLJQRKyHyM0Hf5VGyml39HWtmNN4Xptjoxmu4
	7rCsYPmQlm/VvxJRVjQXNE6pAo0HIthcOjDELEdPKTZTxpmSCFA83XJdUFvoY+sf/mAFCpX4yjD
	FNPoPmjpHWtFHvmRNwy17mtWTSyMPSCz9PlhEUIZDNQM4fnGrPUm5paRYY4uZm897hA==;
From: "Richard Weinberger" <richard@nod.at>
To: "wang wei" <a929244872@163.com>, <sashiko-bot@kernel.org>,
 <bbrezillon@kernel.org>, <miquel.raynal@bootlin.com>,
 <sashiko-reviews@lists.linux.dev>, <vigneshr@ti.com>,
 <wenyou.yang@microchip.com>, <yamada.masahiro@socionext.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 "wang wei" <a929244872@163.com>, <stable@vger.kernel.org>
Subject: =?us-ascii?Q?AW:_[PATCH_V3]_drivers/mtd:_rawnand:_nandsim:_Fix_st?=
 =?us-ascii?Q?ale_NAND=5FROW=5FADDR=5F3_with_overridesize?=
Message-ID: <muqlqvvu.895affce-ffa5-46d3-a538-b190525cab98@nod.at>
In-Reply-To: <20261002024709.16510-1-a929244872@163.com>
References: <20261002024709.16510-1-a929244872@163.com>
Date: Fri, 2 Oct 2026 06:48:47 +0000
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Am Fri, Oct 2, 2026, 04:47 schrieb wang wei <a929244872@163.com>:
> The overridesize module parameter changes the size of the simulated
> device after nand_scan() has completed. It updates nsmtd->size,

Do you actually use this feature?
I suggest just dropping it. It's horrible.

Thanks,
//richard
