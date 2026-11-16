Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845972;
	b=ZKrneSIOb3FXXff2mTmvcIfnvjuVD6Of41HhPXKdDqZMtxuefpxQj7pumkm47aIWO33V
	 7/YxII8TmYRbJzPhPkwrBrFJpV+d6KSc6sY4vQWFuP9KSmjtJzoAgqQWDsYboZ8/ClEAQ
	 Z/e/b88waZDp51bpzvan5CE2Rq9CyqyvqDjtg/702t3kgJhAISgeYQ5yZ+oYeB9bmZgR/
	 7VQOLYGnvIrqrUytdJleX8TF0x3ei5BBYlRdPJUsxQAafZYp/SqSJu6arrye4d+bE+9T5
	 uvac7UCmYtifQe7vIOLEuRK8/60XQish5OWOWKRJ2XV4cXkC5AHyzIP/3XZt/phd5Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845972;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:X-Last-TLS-Session-Version;
	bh=khQi03PC83O/USlRy0JEKfkEZMesY1td5y63oRDAZO8=;
	b=I5KcCxQXI/+05mh75VASQT/e6irQWQNJb4C/G1f1HHWUbFuGsmSy0AHU7sRiftQl1hNk
	 OnHcqlgJXPO5PWj8vv4u3N/q6nISYUtiK7wAjRqncv9+vonAijv77eIuibL6vmIOSgnxs
	 N0i+OlPjHMHFJvOkogvrhUlX4BbAy6FbGFkV7ebfJndtGfMK8hGU/MHp9OohE5W1kDG8y
	 T+oX3OER0wBZjhzVoy9ct6zBkIAEEh4vp65jRDEajjtaqWqFSdRlHOwUtSjvK9TO7suZk
	 wDWym0qyO7o5iAwW3oUfDGXjSrdcSuYBu1NDNAU1u0Gza2bJCu0ry2bOIlaP0MmPQ4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XY6YK8OU;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5A9606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 16:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D5A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XY6YK8OU
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0687F1A169C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 16:19:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9ED46023F;
	Mon, 16 Nov 2026 16:19:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81D5B11BC0D9C;
	Mon, 16 Nov 2026 17:19:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=khQi03PC83O/USlRy0JEKfkEZMesY1td5y63oRDAZO8=;
	b=XY6YK8OUrtm0QD5rlDbgP5CQCXjZeARw6N4BZORuYnurdNfrRAHo9wDT8iiE98luiKGuzg
	T2MHrw5bN2sLuBYr7fma3Okae37MqzTgKv+NEkElmbIRH4MrwV5Oi5qDWXS+GqGiplWrfx
	G/WbSban2iHELGIOI2kbj7T60KGb7f+d8KcZs1xVUynk4rUuNrlYd2GffXmn6cYlViKB5o
	Riov156ZP1ho2O5seZ/kpyNiCxZzkTj7Zb/0Pt9pZvKO0wA4z0yu8yELq7SgpMrhyQhTgE
	ncOxgY4VWdBdKWZoPrrTo02eFrnoOvJ0/yTq6XBzF4ihqq9DhmLwSMadxUAY8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Paul Cercueil" <paul.cercueil@bootlin.com>,  "Richard Weinberger"
 <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,
  sashiko-reviews@lists.linux.dev,  linux-mtd@lists.infradead.org,  "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 04/12] mtd: physmap: Remove #ifdef guards for PM related
 functions
In-Reply-To: <sashiko-outbox-199606@kernel.org> (sashiko-bot@kernel.org's
	message of "Thu, 05 Nov 2026 17:24:23 +0000")
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
	<20261105171158.399247-5-paul.cercueil@bootlin.com>
	<sashiko-outbox-199606@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 17:19:23 +0100
Message-ID: <87mrr8px4k.fsf@bootlin.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 05/11/2026 at 17:24:23 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] mtd: physmap: misuse of pm_ptr() on shutdown hook
> physmap_flash_shutdown()

Low, yet relevant ;-)

