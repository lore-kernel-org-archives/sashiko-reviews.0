Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795768685;
	b=SqpfAuqQ2aV1nB4ddiR313WHo9ie7v2xBa3iaLdGSdsePKICQL58u4c00PDetrcCWP/7
	 cfWDxiRIKWt4qIXdel7NN+TSZlDQnavhbHdkKJZXz86qHuGGKw0h5NxqTAnPK+kqe8V4L
	 JSB1dnRmkzdAdT+hYZODVX7E6s1/0rnRahBqivLkdgQPrGbdty78tCdjKy/vBWoV53mHg
	 LtIMS14n3BlVJxKvIoPGFSzGD38MhSv1aavZxviJGKo6kvYUFuX9+EP9FbDZez8s0iVeE
	 PP1ZFld8/DmTcOFcUn3SlPJAQeAqh36m55//ZffmGOYqMw8FJbBQjraensdd5MKP05A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=+iLLY2LNcOA15ZEBBxvXXqmssEEMm1Qui3OR6b1WQp4=;
	b=lHWI6FW3G9mHDA91ANzix/Ng8F0unzOTZOSEXiFkVM1Zwqc7cs2qy4no1dSZki7/WU2d
	 46Nh5dxZe31GU+xv2NiemNlceca26IY3qON+OFw3wVFoumNZJQVpMk0x/KfwXyhNdWOBi
	 McCf5ixYfy7dlTCwdIiVha5HaLUH8Y62RMOUbXGc1XrNqLAklH9aPzf4rooDJUuP/TahJ
	 2dkkeyt3iBjNHiv7UYj4E2EKZG+IuAQZ/uyxow9GdBz/0+x4dI7uLpB+k0vc8gQdSdcdX
	 n7WKi5n9d9hAjdqhLyABoLR+xV8Oa3wYsH1lv7+XtiCgrI+P7joGeQEx0wW8i1wWsRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEr4dHTl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE37E606A326
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 08:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE37E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rEr4dHTl
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6bb12855c71so391346a12.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 00:38:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795768683; cv=none;
        d=google.com; s=arc-20260327;
        b=q48jZYXjMc9VaGOcDhO6ENWUutuVv+LDlUVOWQf9mNop8PMEbr+RoVGqPRWTKaUsRP
         4q34TXkl/xf7gv8i9G8aeHm/AKbMq/kbBsxSDZCrLYJQxs752ZsplTmeSyisexmN/z+e
         BbqDAIkAroqoLgP6cKF73aPTEa8GTryBsNQRMXJ/4fsUAdcgonroEPE5PNAxpGU+xcCR
         Dj1LZoK/X11JgWVdGGXz+JPKs9eDwolYnZLmlj3uKbrc6EZnKR75eQ5yiv92DQ6MD6DI
         Ir9EUHV31YE9iicpS01NBdEwrrFIrDOCnuAnQqRWtKsUhok7H5dntLZ4Vozo3DsH8V+N
         AAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+iLLY2LNcOA15ZEBBxvXXqmssEEMm1Qui3OR6b1WQp4=;
        fh=JqFMAEs2tdcP9FnU0Fo1YfGBktg5tpfx+cmVBNV6aoY=;
        b=QzVeMpIchk4v0FqZIcx2GTG3wcT43xDUzS1qnoXyXzPpM1DD+Y46VDFBajhJz22uPg
         bvcvZ6fuvhp2euX9qq0S3cHKMOr8KkJ4CyT2Byf9LOc8BBsheOI2MokESEC127HqI4hz
         Hc4t76Oq4+CQEtyqDnCsIvOXatnHSUNVj1jNIhlhQfM1mnDf3dpu79SZLfyNW1kpTsXB
         aDJNxOk+fsRaxES0/BRxCsSR7IaySa9MA41siRfHT83AuIuB/pLTrpKN7/cl22HbGV/W
         NGGLJL5srX+EG8mCX4AkSSpa30UDQb5nWMpFVMw6T8kFhoeakr6KwtXYTxV2hcu+7hNK
         o8eQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795768683; x=1796373483; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iLLY2LNcOA15ZEBBxvXXqmssEEMm1Qui3OR6b1WQp4=;
        b=rEr4dHTlC+ocvZ/GI1Y8cOMlj7nMRxyT3UjP8P58lpNCC/nHkgEWuAgn7c37HUUmPm
         66ezyMqhg+bLDBC/bLuC0OpTJoWDU1dLMV/FMgmvAVaWrjNrAgfy+dr3//cOLuNvWU1t
         qRG7Np8/8NJe2gMcbLXgaOvnWkhAQ7tAOQMaeC2WQZX7Z7ls0rAjBAsLrhK4CLRnJR3L
         kH+FdybClwtpASKu436vV9PoTchXLr1OXd27NCLC2Zr7gjqYeLlIhpIztlZNQsmbVv1U
         MZTYWsqZFi4VBzT92uWn/8dcoKt6kOatE4L43NYOBymG7VnBb4E9M2MKxE3DdhnfGVYY
         87TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768683; x=1796373483;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+iLLY2LNcOA15ZEBBxvXXqmssEEMm1Qui3OR6b1WQp4=;
        b=abAbeAHDus+lvetxwb52SxVwQyxy21XF6DOehSYaZ3iOmrFO1EYlRzqU2m7XB/NWmU
         k2ICWxblhKwBNwbAh3TFuHNoboaclwQTIzIpMafTOGoLHNO9r3B811d8+UuSPM6O+FD+
         T+ehN96hEw6TPToWet9mnmuIfWLUtOPWIl+cGHXcA3k/VwzZMdLXQI22FPJl1xvmj2zX
         KKuSZZcBEVBRJg2kW8DPpskzZlLdr0oja5ZWu1pY41tLq0ryNNgLg3ErHHvD1ql88n3L
         bC6l9ZBPp2uMsMX0l2iuLUeOtMruHvC/PvPbPqnYRCbeilwHlJLVep/hc0Wa1nE/9wZ4
         dFUA==
X-Gm-Message-State: APuU4Z/QXasL4tctKJB0W38srtbnBIRHcx4c0gmj5GWOVba2c3F8rzJS
	ZjxJVRVa7nnrnC0AdeEaYE5kOeJYNyeZ3L5HQFiqPTG2DXExJ4qnbqmypgkdLURNYn/iDxEa1Du
	f9ahZ1EVvBhDue5MdnnBhAu0DKUJlj3TupmheDYvo4A==
X-Gm-Gg: AZFdTZe+1kDW+xXBgrsv5eDSt8KEm+t5oywWDhhy6r9JbpMU0DpKZRJ9Q0ZiteXKFqL
	2wlybdPfWiUCmwvD6KlSkRbU9qMinHqxiI9hOH81NmgqMo1lRz7KLYn1ZSZUFty8QWuqHRm2FRf
	hOwsnFJRv3FeU+hHEDvpaSO8onPqX28XPAb1s07o3zNmiS48+UaJ5BKGkfIcnHgEe/lZ9gjrn4Y
	iEqqXDdLvp1/Rhl2Z4ARTVFrlBHj2xAsjOJgHuTesaD6VwJIo0hQ7KH+ITCAiwqj+YYMtUWSg0L
	up86fqH/LQ+RPJXWUnBn9PPjoEndKTciln70G6VrMoniTm/idR6wzT3QwXUIWI6aL5PmbguWJ94
	5n0x3ad8dyWQ0x6sxLeREm86/2JBQOMPjB5x3woGXAkYi0zxsvEkxOtyu54Ewlw0+T4NCd4k=
X-Received: by 2002:a05:6402:c887:b0:6bb:2a8b:5b2e with SMTP id
 4fb4d7f45d1cf-6bb2a8b5f9dmr6168346a12.1.1795768682451; Fri, 27 Nov 2026
 00:38:02 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
 <20261127-dcphy-rx-v1-v8-3-9ddfef99221d@gmail.com> <sashiko-outbox-236841@kernel.org>
In-Reply-To: <sashiko-outbox-236841@kernel.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 16:37:50 +0800
X-Gm-Features: Aa3M54pu6EO4cdX8RMwrWdtxfoQsdpmDJZ6iQ0uh3wib5NqKabP07P6_hR9dYhg
Message-ID: <CAPwA33Jfp_ybG7gG_PfZoS_7=g3_Fv0w2B9J3xxWsJM7hK-3Ug@mail.gmail.com>
Subject: Re: [PATCH v8 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	olteanv@gmail.com
Content-Type: text/plain; charset="UTF-8"

> This fixes the incomplete error unwind in samsung_mipi_dphy_power_on().
> Should it include a Fixes tag:
>
>   Fixes: b2a1a2ae7818 ("phy: rockchip: Add Samsung MIPI D-/C-PHY driver")

Before this series, the APB reset at the start of the next power_on
cleans up after a PLL lock timeout, so this fixes nothing in older
kernels.

Best regards,
Jason
