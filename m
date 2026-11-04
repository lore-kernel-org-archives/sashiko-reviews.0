Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793774195;
	b=qdLw0X3iAydTJb8W1EcqcGzTfVuVzQKeqhra3EnoDkfFplmI9VNwKEfUL13XweRJHVnq
	 PZJIfIeJhNcNqKGfG3nS0cQxB+ZRzibE40VU7hSam514+MtXsVVTYX71dabh/yOCnyLdK
	 gRUwrsAMXOjweICwrTbh37Brn7BhGLWzMAWFG2rh04cXC6xViECQ5WExkMiNQ5nYuSLI3
	 rBeDIYpUezjzcAzw15grEWgvyOJfVuvawDf2lUjRKtN5H8vSaTPl0qc66/QYh802xpL3d
	 JfIhkD55woEp12xarxGzJnGQ/YogUvxKzfZkjj6TMV/MM5V3jcN249hgCpwFBHxCMIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793774195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7Vb4K6lCtDHR01Edl6F0SYueAkiEMglg1Gv+jMy/ybY=;
	b=z55AhN1owNzH+AtXQQ+4u7lmciHlzAhYqZ6nbw0Hn77ucAIXuYNV8uwoJ+cychzmoLmW
	 uoVX1kIaNVtTQJuH691oK2UHMrCxALDt5uyoXQytnlqsmb3eznpuN9IT9w1m/Pwfdxess
	 OcAZX6jN8VCOOlGdoz7iK5/7vgTMNnRn9C0OGQIKHOoU46qX5C8neuKsyg6HDsllxt3Nw
	 7OncM8xSpKHuo4/fEDU+z7NWvpO5pwt7KkGaZ+2w5GUwP3l15WBBsNc/njMLywTC5YQi7
	 ViHDv8C9bwIcyC1Exm0dVlbBODZtcWi6hevMdOShEL74z7PX/KQD+qku3V6Mr2eLaNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJDBToTH;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E67606A326
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 06:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25E67606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJDBToTH
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35c76e9614aso435807eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 22:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793774189; x=1794378989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Vb4K6lCtDHR01Edl6F0SYueAkiEMglg1Gv+jMy/ybY=;
        b=IJDBToTHWCV7ddePNRps4fuP2eE/gCXUmv0O4mKqVadQZT3XITgJ7ALvUK4Yaz62pb
         DMh//0T0MzJO0HMpVziGh89teh69BWl/EzOkP3xvi+7qXPWo1QAuEBDqiIYNXi//lNdv
         4Sn+pM0GS3IVc1gvqjeYq+levIu40t6TB0E+F7GJsSIJ922g0qYRWnIugxpiDoFWyAya
         3egyFEHG4yT6pvdau72QrRvgXPsyr1vrOZDpcmVUYsF2U+2ARXEeTX6s4z2lqu0aF6lR
         K1+cjlv+NGmuaOYUIao1CkcmlYPoshhkCYgAAvVR4hfBQLVqwtuMkCkTKOuZU9LNu9EH
         uoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793774189; x=1794378989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Vb4K6lCtDHR01Edl6F0SYueAkiEMglg1Gv+jMy/ybY=;
        b=eSBtsGo+0RphZJlM216sAbWLpYRvzGT6uAjZRe9s3v5T3r83sgfM3Z7HU+fnAmdXhw
         QqZyD7B+WjxJ7yeWG2mU6Rxntq/cKt7G9JyhQocDrZEtDSXjsW7+AyybbrAEsBV/REGa
         RmaCwLfnQIpCwYETd8JK1odKctwKBZZ9q6AXuahA1eYwm99e6FvxfcTJH33NLj6p/LrU
         diFeM0t+sB9tvNah5WtY1+nk4CAIB34GmbJhXsVOf69SJuJdRApXKnsH4FhN7cEE27xP
         qm9Vh8610SDKK8mzoaZolYmIJ8ATEidSAyaxrBowPm9TQRomCUPGsszkTjfd7MwX+OYm
         Sy9A==
X-Forwarded-Encrypted: i=1; AKwUvBz8+vvJGj2G4AWsv5D/GA819nGiUadZZPv3eahDiP4Xb3kLNAwPv/7EbghxVdZLGemJw80W0nML0zHwHN/c0tg=@lists.linux.dev
X-Gm-Message-State: APuU4Z9a/QKoXR5m5srY/+f1aM8gpVGMX9Dx48ooO0wpeQulyR+yaMVg
	A68U1cE+2dRgpzizy3NjKUwa+R8Ya8UQ3u19eV1QhH21XihV76s14fk7
X-Gm-Gg: AYBFou317h68f1f8ZQ9X4o73UtFEqS8tRMQDAPNc5uQp4UEFxEwmmSDeytQzlHVHdfF
	NCKMRNqvauhSx0LVwbkVzxuu7Y0xgzCK58FiYWcJvdEVPnBy6fmP4aRZBf0a7cE5FBXUl+dYAW3
	2GY2C/6xWZCtES4qiqTSeQG1TsaH7VtpjVhNG4CoMOwA93WG0+5RJ9sbLR9WkkXEDBphrDsVbzl
	vYFUVXM4vDgmQEQo+OldpB2UDX6UUPMiaOfb1Ny7FS2Gw6p7q8+1phAhpMSbyPeDoetK/WEZWkW
	M6JH4OcWOVfm0lznD+eKDrfmriZ4V5thnLRh/u9wSKfXDqdBLtu9ekFw4g3Xq53UZDtGhwJxgK/
	MVe5vJbtZa4lSOptOf7kijIlpi00tDn4BrLEpmHWV+zM2jlSL586ch9MbhUKweaBanSknChOQVZ
	ZC3U8Q2/zwBPM13MiWKcdejKsUjBciKXhRMG1bdA95z/lg95ZG5pOoq/19t0IlIS18gO0Com4nk
	4/v/c2mcFRwRFKfKjnC0W948eMHMUMtQlNj2OJPVMfRai2TC7SCxHdwR6eNxbAIVjXP+Eay3KrB
	8P8rUUN0OqU1W57qC79kgwkm/fJC
X-Received: by 2002:a05:7301:618a:b0:351:68e8:4646 with SMTP id 5a478bee46e88-36a424199bemr21354637eec.37.1793774189116;
        Tue, 03 Nov 2026 22:36:29 -0800 (PST)
Received: from localhost ([182.216.53.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm5186141eec.2.2026.11.03.22.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:36:28 -0800 (PST)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tracing: Keep copying markers when one instance is stopped
Date: Wed,  4 Nov 2026 15:35:38 +0900
Message-ID: <20261104063552.28094-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103095019.6a88e783@gandalf.local.home>
References: <20261103005219.3236380-1-jaewon8868@gmail.com> <sashiko-outbox-194417@kernel.org> <20261103095019.6a88e783@gandalf.local.home>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The copy_trace_marker documentation says:=0D
=0D
> If no instance has this option set, then a write will error with=0D
> the errno of ENODEV.=0D
=0D
With global copying disabled and another instance enabled, both versions=0D
record the marker in that instance, but the proposed change returns=0D
-ENODEV.=0D
=0D
This seems inconsistent with the documentation. Should we return the=0D
last write's result, as in v2?=0D
