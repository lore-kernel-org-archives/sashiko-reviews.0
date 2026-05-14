Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CAC3B27EC
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 19:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788641; cv=none; b=QYYE+9b2XVPB3Vhdn3yQbL9pus+wyligPvu3D/IHe4RiJziq5mrDQK9okQlA3guV97bQ3ZPAgYdyWGmJgcSGHbX26MAY5hWaQwM/yADzoSRGyyyZ1OfoODkO/YTIUPCujaLkPRbNPhdGymzjON1338zd6OUETez+qbgeO6et1L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788641; c=relaxed/simple;
	bh=Az1IYaOEEgLz6UKgjZworSIXQ7lq5fipFLycaAAHFPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+y4/cjwhvH0tMps8b54VjI11iArEPHEeM9ogxHn6X/bN/K8zJ7OyodXUdQHyh8RxHP0gr8V98A7vjCOxJRzNVy+/y4RhVuLeRZBwOk7/14IpmUNiilf9Fem/U3OBuZ/e/NOFrnBOpiD4O2EQvBLKchkqrjldDmJI4ToKqXe1hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXkDEA4L; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXkDEA4L"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso6258615e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 12:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778788639; x=1779393439; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Az1IYaOEEgLz6UKgjZworSIXQ7lq5fipFLycaAAHFPs=;
        b=kXkDEA4LhQwRoDQ5TDTxd5n3uy7yKfc3SsijXmeSVF+h/gIclaUpIYjZou5BU3W9Nf
         7GK6kWJOLAyCN6wgLsJI2N9xznitm69G4tlSW47rNjYEFTJH1YoOAkh33+be8pQEdUb6
         u7S8b1Oq1A4IlVXAsqAtMo4lHa/nNC+DAB9yLwP56a4qFaoY+kZ23WMYkkNxXDjiuNgV
         5MEltUrUixPcTUDIZx/vKScxlz8yGWonfhCvYUmJpih3GYSlkAubusaTh9RQqs6mssu+
         B/phBDnkI+LNVmL0nlumrmLrAUKlnYHj8ouOaz53pNGbUf0Tf+71nv8V7CWw2JDzXYId
         u6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778788639; x=1779393439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Az1IYaOEEgLz6UKgjZworSIXQ7lq5fipFLycaAAHFPs=;
        b=AqEmYG2cZKqkfvf8XTtkKH8XoaxKQ8uGdcNwuQPryoboA+0JGfort6CfmEfE/EuwNd
         vcDgc4lvFFc3eP6KSnpolLPFmyQ4W4EQYVRAZPrdjeJtV/HoRgR7+94J8QBeiQuKCDf2
         E0EdIVFlQ7xxSFpL5JJrOG7zcePZoXT0Thta1TTvt+obkOfiWS3qBVEUCktcjD66w4gy
         SM5RDtuimHZFjCAdQFa6yKx8hKqIIZuNqw7gfRwULpnxB3ffQ5Vz4onBaVQnQ5Jq8IJc
         GC7B0tG+vL0cu5+Hd1GD5YUvup0MLfjCKTsLpCsbXlKyqBuEP8O4K7GwOLkNn9E4lJCL
         /Cjg==
X-Gm-Message-State: AOJu0YyxsDc0/tByw3ffpLKOZrdRIM9fqoyTfqMkciEq80a7BGXu96zv
	SKZdkgWDy1JTtDFFyFD36z5YPC22tNEGj36wSayf1wnkTXFJw1S4HV7xOxuP8Yq0
X-Gm-Gg: Acq92OHKW2g06PIY5rCq9rbqlOpYW4cjbDvtKMabn/XTdXMa67Y5F7ZVJk26oOK0wVD
	fQvMHXxQ2NtvqScXUWw6fetaPQI70zhIzuLKaWZygRNRAaxPrZr2T4VY+idMysr6861P5sH46tK
	XWJl7MoNTIt/MBuW8pLlcKF8Z7iAMM/KwDOR4KgGxZNiGNox6lFkYusX+6W5jqB+qaIHQdhvGTr
	MIuHfyBZlLeAkdt+AYbxipoHGsrgM+iz4cn5lk1fyqH07d5oCI6onaaWRLeogyQdphlRXrVn7SV
	GzPpR8KMvXbRChvD2ugyu29RU+agghNH6oWKFxMQ7J4VbGBd6N1qth4rmBatr6EpTTL0tXJOgW6
	9UnFQpNmAXJBHlUXOaJ9jpk/VezfC6URn/1Tb4GELwXSwS2HOvTGu3mLc/2v4kOyOui1t5gqGQG
	EbNvIIe98mDLBaBatjdQ==
X-Received: by 2002:a05:600c:b95:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-48fe60ea2dfmr11004965e9.11.1778788638724;
        Thu, 14 May 2026 12:57:18 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab818sm12617995e9.14.2026.05.14.12.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:57:18 -0700 (PDT)
Date: Thu, 14 May 2026 21:57:17 +0200
From: Louis Sautier <sautier.louis@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] scsi: mpt3sas: add hwmon support
Message-ID: <agYpHdvQiUtsXeJw@localhost>
References: <20260512214703.655633-3-sautier.louis@gmail.com>
 <20260514010209.5C3ABC19425@smtp.kernel.org>
 <106e2981-35a1-4559-ae20-2026c224f590@gmail.com>
 <388bb990-3df0-4eb4-983d-59c502397b8c@roeck-us.net>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <388bb990-3df0-4eb4-983d-59c502397b8c@roeck-us.net>

On Wed, 13 May 2026 22:17:26 -0700, Guenter Roeck wrote:
> If you use a recent kernel, the hwmon subsystem serializes sysfs accesses,
> so hammering it from multiple threads should not substantially increase
> the back-end load. If you have 16 readers, 15 of them will wait for the
> hwmon subsystem lock. All lock contention will happen in the hwmon core.

Right, I wasn't aware of this mechanism. So the amplification
path the bot worried about doesn't actually exist?
