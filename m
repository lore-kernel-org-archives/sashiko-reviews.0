Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21314EBAEE
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055677; cv=none; b=i46Zt6le9jjLs2944heVQ9acODb+GsJg8ZDNjTdI3suK6YkTlalIKX3+t6+xVAewHDoG4auLvk0AvSFgVTEU3WUR82ZcQsWekNEgawBWGNRKo5MZQ29gqle2oH/lmP1dn7rQ+XqSulI1KtO8oUzPVnArs0lv1ni6g8g5xk5ebj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055677; c=relaxed/simple;
	bh=GDIs34+0F22s0lXrQtwpdXjAxxPG5r9UfLbC+tcd03Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tQa1ZuPBqcxZlUdG0ZMW2cZe7fbuI6EP7phx9aI553Zf6989S4f64AAaUdjno9duL10Dhn26OSLkqT4bDDbsLlfVmgoDauMGZr1vUxTQzg8qqyfcT+x6sY0Xgzkta7/NRs20Qc3pBxQUYHQDEL8g/J8qZX7CkPVXPNEaZivHbzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N7phaWWQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N7phaWWQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 994121A1230;
	Thu, 15 Oct 2026 09:14:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B48B60360;
	Thu, 15 Oct 2026 09:14:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BD36103284ED;
	Thu, 15 Oct 2026 11:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792055664; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GDIs34+0F22s0lXrQtwpdXjAxxPG5r9UfLbC+tcd03Y=;
	b=N7phaWWQTjNJ/gboiiveDQAAoHOctXPp/BdXU9qB3Qs3q/AkPUvQlQgoJeqn2g6ewqiToY
	NPGWcPj0BEO+Jf2pJKw+uJdi5psjvxi+LgzEqquTKKT08Hp8ORFs2lLM0Y+VDM9Qdoio7A
	mmBYn2zBfBXztMm17fufDi3//B7t84UN6k2ihDjpSblyoBznzaaTiYY3K3CKC7LZ9iNGxG
	KEjaYi1ZYT5GH492TBcju5TnZJUwtBFdpDXaVCLuYP/Rsz5837T2H6aP6GXqC9YXzcrrGG
	cRVkEU7PeyThxkvEoCYz+VAHaIlMANOOGDN4R4WQWZ19wWQHKPkn1dhetMqE1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Tal Zussman" <tz2294@columbia.edu>,  "Joern Engel"
 <joern@lazybastard.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,  Matthew
 Wilcox (Oracle) <willy@infradead.org>,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] mtd: block2mtd: convert _block2mtd_erase() to folios
In-Reply-To: <sashiko-outbox-172225@kernel.org> (sashiko-bot@kernel.org's
	message of "Thu, 15 Oct 2026 03:45:56 +0000")
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
	<20261014-block2mtd-folio-v1-3-19d24ae676ee@columbia.edu>
	<sashiko-outbox-172225@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 15 Oct 2026 11:14:20 +0200
Message-ID: <87mrsfwck3.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Tal,

On 15/10/2026 at 03:45:56 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] mm: missing folio->mapping re-validation after folio_lock()

TBH, I don't know the folio API so I'll let you determine whether this
is a real issue or not.

Miqu=C3=A8l
