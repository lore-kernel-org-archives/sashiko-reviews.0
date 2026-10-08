Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F314140315F
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 07:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445547; cv=pass; b=IIt2+h7j7zq//FU7w7r1dV/6GRlYekY9DWhZulww7z5TJIa8fJA3HJoNK0JJXnYfv3jEnQcqC7CXlPR5O3D04qTFAkTqdHBHmL1WLNC54GxvAUKbKJrv3U7IVC6TqxHolqIOpocnonLy44HOJ1uvcdMgya4S+TS4v325QdPn8fM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445547; c=relaxed/simple;
	bh=5W9MU2ubquZd47q7s5eZMw9anlgx2vW7wLgtcc/INV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RuIE2+OyFIO7J2FlxxgmU1yq7ahcCo9w+3ape4mGI7v8T81d/YHXnj8FtSIn5eP8ecQdCAkXdxLUkqfFvr60rIzqAgT4pV/Zw6aq1yXrggRnkTvH/Fud+PhfSg2vNGU6sd2INzrhAjgwA2Ho2o2Aofxmg1CP3L0cnPA/KWYknHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQHR31cT; arc=pass smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQHR31cT"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5cd7bcaf81cso2139326e0c.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 08 Oct 2026 00:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791445545; cv=none;
        d=google.com; s=arc-20260327;
        b=HIIORHOl6jusBeE4DOym7rU6xlCBAVD6yvH2t7D9901/OvTsAHVF77MmyM0Xgrj4xX
         a8im/VaCDgG+LK9h2jCzPMOwZUYc2D/pBgDp6/PogIadF/YV6T84ouaVEgUrWOCZA4Me
         a5ZwDyw6kD1SWK0Lm6s3FhzmpvQ3x/fd7zWhwimuSzoVUPh46eZ8WQsLvpVUuI/oocuJ
         kXUKWqAwCQS03qBXR7J+6NmdleOKH6JegqBnJx90OKv1+C0b7Zt+HGGWjMmIULs48PxQ
         3yWPEnH2iJ2QCbZcCFuhMv9ks3de/uPpVqgzwYqDA37m7VjARN/k/BNzwyL2LZQ1eMvY
         o3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5W9MU2ubquZd47q7s5eZMw9anlgx2vW7wLgtcc/INV4=;
        fh=2xfOhBJyN5MrDXDnqEqgkqZlEOPXo6XBQo6m99gnAL4=;
        b=sAlTHxtXK8RheTbAKhEZmwFu8g8upcsoiFDquNkPwYEQgJWGJz/4z+fC80OTz5Dsy7
         06iZXLz4HhgTYOJrTXNfV5rrM8j0Ik/Hrlrn1KRfGxmHTEk+kmCiMvjBHTjb175A2102
         BRbBCxHAOmk7aSld8NNnf9/575YBDiTsSYQYWi2rODqVZNAc+exRfDSVF5iAnNVM/DP0
         1W1Syo3XcWkoAzAtapKAbvfvPOXAs4fgrAWSaGNow9j2dpoJoOr2ie0BE8IrYG5e6GMl
         oAgHwP/wv4jTHfHgl9Djmc7e26hc7knlX/XrRwyq88ZwSHBnMPTE3XENpXdHv41JQRKJ
         qtjQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791445545; x=1792050345; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5W9MU2ubquZd47q7s5eZMw9anlgx2vW7wLgtcc/INV4=;
        b=pQHR31cTVP86iAS9ja64uH1+0exwslBJ6YgPmb1O1suq6bjATBt4loWhWy35YEHvqg
         na6qhAdaZ3FvvOQc6m7KjyGswqf6MZgL2+RKlwPZlgolS8YPVkSfe0A5vzfy+6EU7TJ2
         X/HZlx4qwCCaE2Neqs/W2Z9sjS/EUGNXAD0h6kTMPaqCEZrFakTXIH0GNdeGnYEbzRfu
         sgDf4Oc8Gnejiv7fB0ofH5Xc69OlP3qtIY3zURTgonmGJK5FQ71uYeIM7dEgRoAn+zDS
         XzItktNqC9mdWpJd1pSIQYX/dHVUyoNFOQI+abeCwo64N4x0f+qPk8Y4gs8SagyxdXOB
         O6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791445545; x=1792050345;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5W9MU2ubquZd47q7s5eZMw9anlgx2vW7wLgtcc/INV4=;
        b=cMQNJy+CZli9PAuj7VZzqjwhYxX83y1RtNMdXRc+anOn80pQ0CPRR+2PghYYe30fzm
         YavCjZoU9eRJLxPXJEdLMY7J6w6KlNcGe6LqHdWlZonGFBNazma9TN+KqdDXnjaWXmpE
         GYgrStna7QatOgNqK1DEDzKqg+GY0l9KnOu5yk5ZGOTltity2gfiFhzaZsVKkfhrlw2p
         DKeSvUiYew8zunRaUudJ4djVzxpnln6hyu1NNUh+clcCTHdQGYgBVqz5AbUB4HAaROWj
         HgUckKLSOHOUbhIROTU4Atm4RajiKQdRzDSyky+akj7Akrt2fwog/AR4wjZjic+yjVTl
         cpiA==
X-Gm-Message-State: AFq9FYI1uXIiYqJV0X+Hvxv5jN9citVzajXHEZCrKbTcF0ZupWeG6cDw
	qq7lcD8+0Tb3/orngnBbzK8wl+RTodhbNJYWA9pzlm96TiYcesuHCpIBKHuZ3Dg4ZdZQDWDtZUf
	e91CuGWZOSkGequDZyCytknX4H3PJ4tHAxkDOVkIe1A==
X-Gm-Gg: AYBFou0cIXSJImtsBpdUvdLM4rZ/fXBnJyKVFcaD9i5DY83heSFiRLxWn7k6vFTRscw
	JQc+ypI2vYrmkCcN/KvoqDcgAWweYnoQ+Uea4/ZEKoBqIztnqNX63nB3aWQriz2NR4vk8FHxwlR
	g6Ph/DJhdPN2kyk5i6pnCVN8bSbYmx2RN9Q+5gSInMnc4pmCTASbYM53IREjULqXP9hkhjCnR6o
	LddSLdnAYw0lSUi2D5fXnmVOxNlQWPZTVKUx+2gk6cWEMysaJ6gcdwWYOrP2G32ZPX2fEVUsbnu
	PEj3k353Yij/vgk+Vyt9Dbzz9+nSMfWAtOvi+H0T2RLr+WFzyMuUnM68HeL89WwKVsNbFm8OTH8
	hXChPVEgNm4DxPZs+d4IwYo9ZVwFtXqCPJohfkJBCJzVNEfRJe9ZxZlTHnBtZLagwEwhjUt50m1
	43iAmfKqAPZkx6tSWsZvozopF7IO+3L/yCZ4kVS7jnnd2lwIrFGn8Xe08=
X-Received: by 2002:a05:6122:4b81:b0:5e2:ef90:d438 with SMTP id
 71dfb90a1353d-5e6d2c26fa1mr1670535e0c.13.1791445541148; Thu, 08 Oct 2026
 00:45:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008-b4-elan2514-irq-route-v2-1-432d95eb7348@gmail.com> <sashiko-outbox-163750@kernel.org>
In-Reply-To: <sashiko-outbox-163750@kernel.org>
From: Waqar Gulzar <iamwaqargulzar@gmail.com>
Date: Thu, 8 Oct 2026 12:45:29 +0500
X-Gm-Features: AclHuK8q4VPUC_WMWTIOyFQ3S2zIGEHB1qbr-nZwIRCXR2cKAYAVR4iHOlSzFiQ
Message-ID: <CADeB2YrOd10OX-BzjJ30p4ukC0OsCv3-gooOf0WxXfiZx7ChMg@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid-acpi: restore touchscreen IRQ routing on
 HP OmniBook Flip laptops
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On the wakeup question (same as raised on v1): the ELAN2514 is not
wake-capable on these boards. TPL1 has no _PRW, and its _CRS interrupt
is not marked wake-capable, so i2c_acpi_get_irq() reports wake_capable
= false, I2C_CLIENT_WAKE is never set, and the device has no
power/wakeup attribute in sysfs (checked on 8DA1, BIOS F.20).
device_may_wakeup() is therefore always false, and power_up runs on
every resume.

If a future firmware marked the interrupt wake-capable,
i2c_hid_core_suspend() would also skip power_down under the same
condition, so the driver would not take the device through the
D3cold/_ON cycle that clears the routing in the first place.

Waqar
