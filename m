Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907940;
	b=EAX47SFMVZZuaXAhivQbI8Mh7WY2w8dpp/7IDYsRTy22WQDagdr2doRm+iAO/7MDiGB5
	 eJkHRRGAZIED9b1gnNkbVOofmAXNW62OVcUYIzCPt8wjds9YOIo3CTsGuzTvIhhlkwvmQ
	 XUF1bHXkuwcVf3oqlH3LFq5NURf8alAjYZ5qF9N53P1Mqhr/h6Y6IK7UaTg64OdQSByNg
	 JfuCHQsZK9gn/IYALwhk5fYSRoUg8sETg2tYeTNdTtBervQjoDW6XZ6/QogNj7tDbr1GB
	 1280tGN7swOfA/uPRb6sRVbfBuJDZNqh2yHtvrWwlwhj7fBtOqBebQTryMMI1NN9D5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907940;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=IBxaDtxEFbt7EaXeVIegfF0agASFb0b/mgcN6FmZRmo=;
	b=DCG9qg9pK20G9YoLYe+ppIc+TgQp1nk6Yjm0N43y1clmdcXmC4nLqXMxQChWYXfwIvYQ
	 prLjV5qgwZd1SWbvetik3OuwP0UHolHnyUDyfgesWOX6r7vMRmhP6outSFC2uPbemGkzn
	 6ejsjNE7J7vnowL6wNIWlW7TfJ9qiNhaAacxApDOdwIJR+zTNeNUXlzbfXDENKZSR1aWe
	 D8jSZJKH0L1ZhmyQrFf8sqLst7bBISEYMjlBrNLDgz2ZWogeEdgIvtxAEgE4inLCC7b/G
	 7Efu7FKk2cQA5jrZesM89gyGjXtgIEKcvJwOyD3jx71YgfcFPi7G7qujOG6ieySeRgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=w5vlP6IL;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76679606A334
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 09:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76679606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=w5vlP6IL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3B857C4EDB9;
	Tue, 17 Nov 2026 09:32:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2F465FC81;
	Tue, 17 Nov 2026 09:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33EDB11BC0B8F;
	Tue, 17 Nov 2026 10:32:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794907937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IBxaDtxEFbt7EaXeVIegfF0agASFb0b/mgcN6FmZRmo=;
	b=w5vlP6IL/GycJsIMBHMBkgYPBSS75OMaJOjzH1dsEqPf4LEf9C4kiWOZ4Kg2Hsvhuc0+O5
	JFAtymxLsx6azH7GOpnh8nmHAdh0aC5lMNrMqF0fcnccQsY/5NKECpuCk8JrnMtr4AWKOW
	xKoDD/wESnByY9GgprQrfQho+H5ErjZCsDW80DjIX/AVycnIdkvfEHaSdv2UPmMOCl0Hgf
	68M+Eu5rqwUxW+p+x/GYRqD3cE/B3sEWE9cbj90AseIliq2kMjg/Zv06OenE0PSFE0UEs9
	ADxkoXJncxo0t2eMvOlfaESNTkG45wQDlvo7M6KTm7aiLNELi9SWkE2Cd+Snfw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Zhao Feng" <zhaofeng2@cmss.chinamobile.com>,
  linux-mtd@lists.infradead.org,  sashiko-reviews@lists.linux.dev,
  richard@nod.at,  michal.simek@amd.com
Subject: Re: [PATCH 1/2] mtd: rawnand: fix GPIO descriptor leak in
 rawnand_dt_parse_gpio_cs()
In-Reply-To: <sashiko-outbox-205535@kernel.org> (sashiko-bot@kernel.org's
	message of "Mon, 09 Nov 2026 20:05:33 +0000")
References: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
	<20261109052724.1032-2-zhaofeng2@cmss.chinamobile.com>
	<sashiko-outbox-205535@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 10:32:13 +0100
Message-ID: <87eccjolb6.fsf@bootlin.com>
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

On 09/11/2026 at 20:05:33 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Medium] mtd: rawnand: arasan: GPIO descriptor leak in anfc_probe()
>   and anfc_parse_cs() [1]

I believe switching to the managed version like Sashiko proposes is a
better approach.

Can you please respin?

Thanks,
Miqu=C3=A8l
