Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7CF3EDAC1
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327178; cv=none; b=tdmVQ1wb0OYNmw4E7n7pwDQ8Ed7O3WUHOp3jY7Gzy0hMFDc9FgsfIb19ewfiIg/7pM+8fVVKVXh8is10nl6y7U8OFdvTIqx6c8gkG+L+7CgPTCQaISnRCyHe3Qd9seuf+JAhrVmHtVqEdaXNU5VCtgzRv7BRmflK8HiNTvj4eW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327178; c=relaxed/simple;
	bh=D5whuOq+QlG8L8X1qHqgY8y2NRAujgBvpsz93xSPRaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDlkoDeQvWeNHiXZrCL7VjBtwH0vLHJ/J0oqfZZ84BiVg7XGaj5tCv2icUePLYXDxlu8ik7W7nCy4/4blIlCZPIsX4gcTnn2Liuf7NUvG2VSxL9TbjzI2eLSNlkOm8Rh5zn5cYiF5RJMQOwq4PoAdeVHoAAavqrlCbICgigTw5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I78LcsGj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I78LcsGj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so20316115e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 01:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327169; x=1783931969; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhgGnNuXnWH4hPrMvepsO/9ELPw89h4l69pd3BoNRLc=;
        b=I78LcsGjrSNQGdPOwvZSyHFCxKGxg+knCda43Yo7VtLb49hLJFj+4k3hNWN6AQN+AR
         cNw9JtvtVp4Xf4YXNacmFRS+7iToeg1UoFVPG/crT70XcmlRzEXaPfOh+i6XaS1tgRLo
         hXFFxILF0Y5+lvuGpSRdRV4Yv6l/ecj/fDvVysSa6uzX0q66V3U4xw6/EbFcTlHqPbUM
         HLhvmVgMm/iNIux1p2Jb0jI9evFGJ2CxfPw2x2h2C8DXQCT7ChAS9eomL3UfmgvAgtB3
         1/YNn0WAsaPcii0i91sGfs3YA22srkxwdd8K8+THYLeIMPDRIW0+ckArkOe5LYIe7ZFW
         mVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327169; x=1783931969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhgGnNuXnWH4hPrMvepsO/9ELPw89h4l69pd3BoNRLc=;
        b=HW53ioafhMkyKJkQvKfjO90SqnS20qUnBGRa4XqL+0URx950RKhMcEATiZB1I0fQeu
         EsmDtFWjLdl9B4mnoUal882LFHW7o7KQZw3oN7kf/AmouJDO8ZH+ZqQDWwTBM28YKGYN
         1ONvVePeM0sra+hFPH/2rlPjfRwRjcGhCuZbBTCqBz3ZYeVDLb4CqHnQbHUTe4PezyPd
         b6nhBQ+ETKbMfzRptYIYdJkdhq5bBSGssnz/1/AXUdlP7ZOSfjy62HxFhY5mJ22F38Zj
         XlRmbx2VdWd/r9TQHqwTM9WdaKF4Ag4jlibtTkuHJSDRRk8Sl6crKOp+/onhPlMiZVky
         QwrA==
X-Forwarded-Encrypted: i=1; AHgh+RrG1y+l39Ecp3W2wKjnuel6UixHou3BQyAQ7SI6CtLsyaMyAqgkiTkd1Z8nBd0OA3hcdHnQGfMYydAjE85J/TY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/DKMxCwOfravR7lozPNG9pojOSQQheSj9OU4G2+vMJRfHdWye
	Xc+iB7PN3BmPJa/6a4+GdbHZBYloDOOO3ZUAtUAuB9zefT8A9qdcwomp
X-Gm-Gg: AfdE7cnx4DxWvJq2LE3NlhQ/Ca9A/1sMFMu/CPOL8mmyCRy/iDzeHN52GD3swz96pvk
	6FPlM6eRSPvijOzpx8/KSzhl9Jq2piGEIcL9g9KG+hgBjvenhZMMHNARPZdHMhcdo4A0jEOltkP
	W1i9fv0Ao1wN4qN+T9Oo25V2mRP/CgD64Zk2w2olSeB/NGGycUnLIbw0DSIm773jJW8XhExBKAr
	g1vBgvyHcKAmrimgIQ2+ydS18K9C+wYxjnf1z+22n1LJ5ggJRZBzCyAHYC7wy2hfK/UwNkpKH7S
	8FESPZDNRhBg6jumJ3d6+tMeYcgaGc4dCwUGxgwlyyv8ukUrayBQWKpDTpjVNfzWyMLej3dm4y5
	OcsqgZq+zSQX81dVzxai35+5YsXHHIHtZJq924YpUCt1BMLG+qPAxEU1CrSqKX/NbOBOIOsva8m
	TbrL0ooBmm3SSYi71lBAIZjBFO6cI=
X-Received: by 2002:a05:600c:8b67:b0:493:bc88:ddcf with SMTP id 5b1f17b1804b1-493d11f35f7mr101767645e9.23.1783327169115;
        Mon, 06 Jul 2026 01:39:29 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636e9e9sm338236185e9.2.2026.07.06.01.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:39:28 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	krzk+dt@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: Add Solomon SSD1351 OLED controller
Date: Mon,  6 Jul 2026 11:39:13 +0300
Message-ID: <20260706083913.19172-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260704081758.0BD4D1F000E9@smtp.kernel.org>
References: 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>>     Assisted-by: Claude:claude-opus-4-8
>
> [Severity: Low]
> This isn't a bug, but this Git trailer does not follow the standard format
> `Tag: Full Name <email@address.tld>`. Without an email address enclosed in
> angle brackets, this will likely trigger checkpatch warnings.

This is a standard Assisted-by tag, see Documentation/process/coding-assistants.rst
for basis.

>> +allOf:
>> +  - $ref: solomon,ssd-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - solomon,ssd1351
>
> [Severity: Low]
> Should there be default values defined for `solomon,width` and
> `solomon,height` in this block? 
> 
> Since the common schema `solomon,ssd-common.yaml` indicates these defaults
> are controller-dependent, omitting them here leaves the hardware's default
> resolution undocumented in this schema.

These defaults were present in v1 and were dropped for v2 following
Krzysztof's review: this binding has a single compatible, so the hardware
default (128x128) is deducible from the compatible itself and does not
need to be restated in the schema. The driver applies that default when
the properties are absent, and the properties remain available through
solomon,ssd-common.yaml for modules that wire a smaller panel.

Keeping them out, per that earlier feedback.
