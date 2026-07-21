Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696C13C6606
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625269; cv=pass; b=RdtD+VSL8EimolVlafVI1ZvBVKdqSm5g0irPxEXNSxP/pfx/+I2zHsbRQl/8hEyZDrDkhvD1kD/Fc+Dozy9zQ7weUrDw9WG98HIi0wNJS5yrLl1MujB7BW8uhHuli3ky7LYeTJowXpZpN5AJYnxJUPj7tSpH2/hJ4q+mv8cWbnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625269; c=relaxed/simple;
	bh=jxUJpaNgkxoxX1of+Vq0hIIqoyhWOdU80zDaUZJLUtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+LyaGa7GrRH6VmFYR3fh/HBqIXsQLGYa1pj21Miy5YyhjdOGEmdJ/oRGbpAYjOzaicIp/EnDDXtJVgZsQYRx5UXE0+pOSFeL9PUjzCwob9JqjYhItcC4b+5Wn54OmJ1RSX4JC/d8033FFHmAN/aUHr40M0eVgkcI9VybHNPrSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUcsKOXO; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUcsKOXO"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c12614b81c9so1989878966b.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 02:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784625266; cv=none;
        d=google.com; s=arc-20260327;
        b=bA/omITY57TyzH/k3BRUNzo4bQ52vJK076OugGaF/gYHUfhINfEre9O4r7Is5u5d3B
         dMXdKN5c4aiwsX24iSt3s8YeQNgbB0OxMxYP/6q30CZTXLWqV8wjwSncIDnPYJbNTDgJ
         NEJqxVS1AAkIOuds/L/PWRzDNkBlpjC1OqBarfod/zRGcrV3tbuyF8slJt0dLW1r0+vq
         1/IuYnfxQa1J3ZBwoe8LASYXCjthkSctOVBsqibwN0uiowL2+mebaWM3SKmn820CoaPE
         /Oams2ICQmaT8RH9nqO7T5p+uzz7sPM0Yl3ACR0m1jbdyHTub6o/I+FFbLd3BJVjOvKL
         1wJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jxUJpaNgkxoxX1of+Vq0hIIqoyhWOdU80zDaUZJLUtg=;
        fh=q2oa1ekct7KR5WHTVsuodzZeNY7MhQ5926J4NNvSleA=;
        b=cDpisv5/Che1HvzdLDArdDo1Ncku+dPQOIw04aiOxASgExAx1UORituoQ+95fcBlAF
         pedyH5nYXxlcrf2jAF7XPEW0ketsA4QHF8uy5ghz4QKsWAWMdkT4szet6Wszmkcz1t4i
         rPMlIGrgI8of0VI17rINzRHfRL872p85CHNxdNbRvMJLNtkMWuzUaLvS2CJU2aWryRPK
         yLf48IKa7SWL4cxmt3AV9g/f4x00zGO91naZ35bnmTHarP6ratDqUbgeaDfeJa89pacF
         o68ajsDrjbdPAg6EbPQpBS1GwfCkiQXwVNOkZIZiXqSxjswJN+SujycUMqzhz0O0ukda
         4EQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784625266; x=1785230066; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jxUJpaNgkxoxX1of+Vq0hIIqoyhWOdU80zDaUZJLUtg=;
        b=aUcsKOXOb+nAbn+eBDLDt5GgyqzEiEIrSKEUyJgngWWc0UmhBnxcYYQQqv+ipDhB2P
         a4IrIcuanrbrvtlSSdHsTOI3cSw3TrM8WNcXp4ewyEGxJBWE7AKdHuuL2hb3eYNx1WKP
         hcwgFomaOV64rYtZ4UYYxBmsO+gOXyFnezr6C3rNFTsP7gDluB8dDkZfbvK1ZvZRhCqE
         PyhCr+a9N2oNdB4R7vPQFisHODGen+fp7fWTUfwzgyn6gCmqlLKZYyxkLVqrayfGkq0H
         ZUZXwCQESDnG8oFbKnxHwD8/2lozQgkFI7UvpkpgLSxgLNbarnpKl0hTAGAErtyIntsU
         Rdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784625266; x=1785230066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxUJpaNgkxoxX1of+Vq0hIIqoyhWOdU80zDaUZJLUtg=;
        b=BiUmO+Vfvmu/PtfBEYmXbdcgfdKJ491xmgqbRAXr+4z7F5c+FdmDsGYUjFRGJAUl86
         t2/Bm8d5SH8vlsDUFKqx4RqQjSwBxexDk2wV4actRybH7638dy3AVsPG7AAIvUYqi0OH
         RfLM4GTqn/JBSZzxjXHTepeSuU3vF25b041VJydfYXhI7tA3B5Is3d/JH5vtqDeaH9Mj
         X8DUUM5cag8jdzdqV5c3uu5wcn4FX5mhhkuUow5hbqDDS8fkPSAzQnSeeuEKs423cFBQ
         c3UrHAh93TK5Ju5upNOMNn0tpB+ZtQTY2TP78c3LI0a6sOzAIwJbQPHB+gT9HVzOdbZI
         07mQ==
X-Gm-Message-State: AOJu0YxPLc1ezzXhb8grN/Yutj35OvA7xjTAYpPm8TYFFqa7YJPyv6pb
	F0s+pfVyP5iKCqO9bb2kQewgz1OIIfU2jPlox5O4wL3BYu8+3dqpcAo8KgA5hccQvs/74IK3h4o
	1aNP01JnpJqGL8yfYBt7zyV0EskPQcV5IhLCK
X-Gm-Gg: AfdE7cmK4zZ3N1rofPOOYI/tpQ8eds+OZ4L0amhX/4PywAMLLWHGUWRHftcd/zvIAtt
	u06ibWVVS2FEfQ96aduzvOmgDvDverLhrqTo8BnOjSTWnpMuSaIE5mpopJp1BVwIavbEptd/Jxw
	fPimOz67gAcQ+KnQm5C/irVgG/zmgK1yg3Up5ckbb6nWtsCnM6orOvu7GZCHX9dWpSAdLMNAd+q
	QmNWnVgzNjOHr6O586qbr8pZqo+ycB+j8YDNh168dxLHq4o+WxvY62IEyGtkIGw49q8IbGOt1xp
	XegQCQxz
X-Received: by 2002:a17:907:9309:b0:c16:8cd0:c6b7 with SMTP id
 a640c23a62f3a-c16b46e2994mr968783466b.14.1784625266368; Tue, 21 Jul 2026
 02:14:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716173325.653164-1-a.shimko.dev@gmail.com>
 <20260716173325.653164-3-a.shimko.dev@gmail.com> <20260717173344.81F261F00A3A@smtp.kernel.org>
In-Reply-To: <20260717173344.81F261F00A3A@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 21 Jul 2026 12:14:14 +0300
X-Gm-Features: AUfX_my2iLa_MdkLxTrmaGRe3Cxwt7-lD70kzqKaGy7k8URbIw76tvXSuk8ebPk
Message-ID: <CAOPX747aYkoi_aE+tkpsyRsd9BDeAE9LKyYPnE1tMkjeu7vhWw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 17, 2026 at 8:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> Does declaring val as u16 truncate negative error codes returned by
> dap8211r_read_ext() during polling?
>
> If dap8211r_read_ext() returns a negative error like -EIO, the truncated
> value will still have its high bit set, which might cause the polling
> loop below to exit early and falsely report success.
Thank you, it will be fixed.

> [Severity: High]
> If the rx-internal-delay-ps property is missing and the interface mode is
> PHY_INTERFACE_MODE_RGMII_TXID, does this fallback logic incorrectly apply
> the default delay (DAP8211R_DEFAULT_DEL_SEL) to the RX path?
>
> For RGMII_TXID, should the RX delay instead be 0?

> [Severity: High]
> Similarly, if tx-internal-delay-ps is missing and the interface mode is
> PHY_INTERFACE_MODE_RGMII_RXID, will this incorrectly apply the default de=
lay
> to the TX path when it should be 0?
Agree, both cases are my fail.

> [Severity: High]
> Is the RGMII configuration written to the PHY after the software reset
> completes?
Thank you for catching this. The RGMII configuration must be written
before triggering the software reset so that the reset applies the new
settings. I'll reorder it to:
1. Write RGMII configuration
2. Software reset
3. Wait for reset self-clear
--
Best regards,
Artem
