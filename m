Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588833D9DDB
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 09:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883875; cv=none; b=QfueRHS9uxd6eululKKR4tGK2D8Ey9elv6ljIdqR0eVGqoXaFNnFKcVnUnzbnssELH9+Ztn63b/2Mnb+Cwiw3TG+KBp5gV4RtmxK1gb4XEPsE0fA4d6cjuo5xrHHOhpv0nRGGgeaQ/5uNl8sKLKNsZyZ+4qiQor+Zx2U9BxjGxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883875; c=relaxed/simple;
	bh=XVFaXEYG2jOij3HyMr7u9yLLDZy3V4Xivvx6eVWoUcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNUUaEYKiZXMjr/wWTwaLI9U/A2I5fq9QcYMz0n7gvAdBPCh+u6BeWYIniJwzQRmQvSb1zXvTGky9qJAPSg2M7qM5Eu9JOZmOpIRYO4ZrFuD9cBu0qFs5Uzd/7ZouvM+FTvu2ElxY77/z/4gUyF1/ozkgBvY5MCSkGh9VImB8iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZfsku81; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZfsku81"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso327038566b.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883872; x=1792488672; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+NB6q1K55xrXTqewDbSwetE1j/mAPNyb/yxnJTgeOys=;
        b=SZfsku81ocI27DyGGFhzYzUuZMUin4O0FXu02BJug+Fy/gWpLrv7LOFsMpyV51c2qO
         sdbskvwYc91C9bXX3dXMJAAapRAiA29X81bIOlfIfg/0SV/F+r59bAPaBtSGLprqyB7C
         sFyFBdDD7a9Nw2F4H+tst/tWIj8YSEoFPlOvcNSTe2MG4NR3hQuJoJKdyx3edQ1Sdfd6
         7qHmw3MPXXzcjlmjU6nH/vhQAPS6DoBYR5OM8BBH4H8iRVhR257sPc4sr/kk990bZhhw
         YsBv4R04CNcWlzH8FSbPTlDAwRf5P02vaQHZyRcvwkx17mqjAUqlptoo6oKbFG1IdSIt
         MqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883872; x=1792488672;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NB6q1K55xrXTqewDbSwetE1j/mAPNyb/yxnJTgeOys=;
        b=rWMaj89SpysqrMgFZmuHSGPFZa8FXOTEble3GcFKgUeQBdIpOSPCg1C75DNX+iDd6m
         lOMNs1oUWwWbfEY8vAiVVYQYUUW+UqOGtqws7qx7x6FOR7xCjaDAjQ2iOcvXb48NEvgF
         7W23hJinG1mDpmSkU9XgzyTSfKOq0tTGx2bzLXPW6664zFz5bosPltjgsXVg/eI8/6qj
         R6qR6HdjwEWZWdGot0vSlo0UPLpdszxybhvk1zyvvYLh7vmkuyyxSJNOnsEH4S10h4nV
         ncVG4fkAXxzk1Yjf/E3EZtYmkgzYl5qesM0CytvaVX5ylgeko8Z1B1xlzVT3AV7xQY20
         8Ymw==
X-Gm-Message-State: AFq9FYJSYtD29KvEeCHCw8pJb58T0VlhpliRQ6i1sFFXRxWmsopBi3hw
	WNRrDXIqhOKfsPbZ4+KMdlOx2vdnXXdpoFvFo2ZbtP6S2roW8Q7lxInV6SuPIq/K
X-Gm-Gg: AYBFou1AgMPaZU1RBg/cL8WmLI76e4Qp6NX2rn172BD63hdHPrSqKvJOuzkBEGt/4bY
	yxQ/8Idu4pBaisLkDARcH+llkz3Aj+ozr7DVDVisDpRBd5y+3vpnUq4FFd2KkcvQFYGs/vSOOyn
	PkiwpUuHgU9GDMnE10OCM5KFn4M0+j+vIWB6pbJwz9U5Xoecpkl/33KtYDcFE7cdwHCKPv+INHZ
	VLHhwBtrtu7bpt5ButxXMjIkiVJ8ZIxge6fEbgvHWf4KXJpWilulH1NPScxvnUPavWpZLJl66Y/
	W5HN8hTxwPsoT4qgajyzcoHZdzjXNKDZVV4cNgecwe2PDwvqR2LhAa/IO855rH+j+vpJNOwZYbz
	ZbrOOUSZrU8Or6jh62fvfZtrnYCA4YvAQBg3AxG7aRuzE6etyNXMXpolHqCAaO1lPAFIs+HyPat
	pRPT0twj6iTmom14AMSD11P80kUlQ675CmvzuJKbnKJgMgDtk28l3C1rBNvExm49QgKxtrCNC3h
	vC4Uy3BOOzvbYY1IgvClondWkBhFPMcf2hW6uMIc3yOc03ThdfcHylyekKL
X-Received: by 2002:a17:906:f5aa:b0:c2e:3abd:aadd with SMTP id a640c23a62f3a-c31aa093e85mr1058348666b.37.1791883872324;
        Tue, 13 Oct 2026 02:31:12 -0700 (PDT)
Received: from rillian-arch.localnet ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c366ed191basm105213166b.15.2026.10.13.02.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:31:11 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, lee@kernel.org
Subject:
 Re: [PATCH v3 2/4] leds: flash: Add support for the TI LM3643 dual LED flash
 driver
Date: Tue, 13 Oct 2026 10:31:11 +0100
Message-ID: <LwK5_fJASKu0tC1wo7o7Uw@gmail.com>
In-Reply-To: <sashiko-outbox-167401@kernel.org>
References:
 <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-3-rillian.grant@gmail.com>
 <sashiko-outbox-167401@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

> [Severity: Low]
> This isn't a bug, but does this commit subject violate the subsystem naming
> conventions?
> 
> According to the LED subsystem guidelines, embedding subsystem subdirectory
> names like flash into the prefix hinders Git history categorization.
> Embedding implementation details can also create rigid and non-reusable
> drivers.
> 
> Could the driver name lm3643 be used in the prefix instead, such as
> "leds: lm3643: "?

Happy to switch to "leds: flash: lm3643:" across the series if there is
another revision, or for the maintainer to adjust when applying.

> [Severity: Medium]
> Does this sequence require a hardware startup delay after asserting the
> enable GPIO?
> 
> The lm3643_probe() function drives the HWEN GPIO high and then shortly after
> initiates an I2C regmap_read() to fetch the device ID. Failing to provide a
> programmatic delay (e.g., via usleep_range) might cause the I2C transfer to
> fail on platforms where the CPU executes the bus transaction before the
> hardware state machine and internal oscillator are fully initialized.
> 
> Could a small delay be added here to ensure the chip is ready for I2C
> traffic before the register read is attempted?

The LM3643 datasheet specifies no delay between HWEN high and I2C ready,
so I'd rather not add an arbitrary sleep.

-- 
Rillian Grant


