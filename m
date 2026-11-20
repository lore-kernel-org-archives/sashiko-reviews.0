Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163118;
	b=5hnLw6hgxRSs4oajLP2qXcZjKXSdCh23r6Lw3S6KzPJRtJSj/WdM2kjDM1AGcrPPiwML
	 7fJjrmwx4Y5RQuOZX2XAcRISDQ1jbRWV48XGPH3a/0Un7Hl3jm0rwRcIyp3+AxEc8BuvI
	 C+OaS3FZAFb0+uy3WD3JmZNgUeuNdKJ2an5vXbmgm+/uZNebKnXa1ZdQPiB0vOedFEAfk
	 AcU+ChUdQuHnKYLQ3P0bskq/uNE6ZbgtwYHIqmGQDs0jYWt2t03W9oJfURHfbMWFXsK60
	 RLzMXNoJQ2U1v67oQ8J8tWvLiYFGo+f+FppfgjGeyeMzpOTmdiiIUV1LtYmHe5JKxvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163118;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=VFrgg5jZYdLBp2CRTfMvRlGf8xonD5krWYoXoAMfpFQ=;
	b=d/BDht8rLE7zpm9nxlJNpkDusTZoQe9zricUf36hd3Mji4gGYokMY9dCrjSLkRj/FO+9
	 Z7dr/cQGExN5QVsU6emdKqa37tTj/yXqvNTq2tGJfqElSy/aX9c3p/4D6TETjyEdWcddf
	 6bKdyopkl2Vlq6NJgyIh6x3zx8sqUwFb/n7yhe+5EJRCQ1bOSDA245Z5cHkHlV/lSNk1v
	 dgw+0C64AQ96f1xx/s0z7mCwsHdjIe3pg5NQkF53+g3mijZ7D1ClByk9v/Mek7/nUSBuK
	 sMGyMl1oHUfdEku4W5ursH9oAoFA39WospLMAlOlB5nL4QMWCCdwyUa2cTH4xALeE1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jCgXs8hG;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F173F606A325
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 08:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F173F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jCgXs8hG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C85BFC2F4DE;
	Fri, 20 Nov 2026 08:25:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6B0D6017D;
	Fri, 20 Nov 2026 08:25:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D534611BC10CA;
	Fri, 20 Nov 2026 09:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795163108; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VFrgg5jZYdLBp2CRTfMvRlGf8xonD5krWYoXoAMfpFQ=;
	b=jCgXs8hGnlyX3AMu1wnowxZy3tkSVgFBsnOQjmsCw+VmVY+tVRhNwf7FYdG1mR5Vum8s/9
	eZiHutJ9xwDdeAL0gCGBHez18Skg2W7uvsUnEmhvGbkPCQq0fGUoNBP+8iMw1Se6TZRhhp
	jJ5iWPmP0ca61D4O68btfV6rejgQn7oRXgvmLgZ4HRcyr4p08vujpk0RrtsUnuk953h32L
	+9FBw55aJKzAUDkxv2ymcIZ7uaBlgKpJCNUixI+r+Rj4SMahCbZs9zCLt/XyIMzOUwxnmr
	syZ0XUKwXUExg3fLCqgfGJS31jp0lDq6hHRddYwIHuYYRm1o5B5vOVtXgVoLoQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Edward Adam Davis" <eadavis@sina.com>,
  sashiko-reviews@lists.linux.dev,  joern@lazybastard.org,
  linux-mtd@lists.infradead.org,  richard@nod.at,
  syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com,
  syzkaller-bugs@googlegroups.com,  vigneshr@ti.com
Subject: Re: [PATCH v2] mtd: Use I/O memory accessors when in an uncached
In-Reply-To: <sashiko-outbox-224492@kernel.org> (sashiko-bot@kernel.org's
	message of "Fri, 20 Nov 2026 05:35:32 +0000")
References: <sashiko-outbox-224471@kernel.org>
	<20261120052434.101613-1-eadavis@sina.com>
	<sashiko-outbox-224492@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 20 Nov 2026 09:25:02 +0100
Message-ID: <87zev3c3kx.fsf@bootlin.com>
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

Hi Edward,=20

On 20/11/2026 at 05:35:32 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] mtd: phram: uncached ioremap() pointer exposed via
>   phram_point()
> - [Low] mtd: phram: inaccurate Fixes trailer and truncated commit
>   message

These issues look plausible, I'll let you answer them.

Thanks,
Miqu=C3=A8l
