Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795285414;
	b=VOVdoifWjhzzP7PUIqkTXAYJSpjUQE6qBw7wMXqAsw4jz3bgeWjUdRaC3za/GGTjt1kt
	 TT0u6O5F0TaSiDet18+NNSSNJZqpRMyoeFZdeB4VEzeQBBUxlDJVb4ebMsgFjY2XRRxkN
	 UDu8hEAdXupv5vEn8W03v9o8J+KagE2gv/x2PzNLJo0lz3N4Y4yeLUgNYNX4PrUXW+6s3
	 DQl1GA46APeRl/BsrtE4/hKvIey8ZQWSlycZHPf7R0HAbRcsaIHW9QdB+saau8Hxeinpd
	 tBsvc2CO3/nicrA1rcYDMaI7O5BEO5E0cB27dlzv25nsi/1n4lBC3mgch72r3PPD5lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Z75xzDza/hooSCAJFqk47whifzAJZg7dX21ijDhOozU=;
	b=twJ+AyWiaSiqDaowV1mRq+WdH5D5EZJbz2g/HSTnQSNWAqOpGHWZCqwuTPF3w8eI6Hf9
	 G/2LWtmGq3ka8gilxacxz80L3bCZK/0HOo4kdMBWSvG4W0N0CKG6nORFH2rOt5Vj03Z6w
	 QE4RvZ+iyy1ZsDVGCTnFPqE3AUbNBlZeKrcdZ8kXTBB51TdYumQrXh8pH2Eh4WpZ1EWwA
	 4i8TO3tt5CSjXjpUduZ5iql3l8qoZIGVfXVnR9XA+nsuAQNhV97QWELW/t4a4okIXlHUa
	 7++9hEUN3vl1EkVpdGb1yzII4Go+i59+rUyONOBfjyvAI1lHCIdKgxd+ggQ1PXvHAtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eeFJ87Dj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3125D606A32A
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 18:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3125D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eeFJ87Dj
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ad0102edd4so18135411fa.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 10:23:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795285412; cv=none;
        d=google.com; s=arc-20260327;
        b=CBQaGLqBzf/2qNss0rZ8+yv5unCiy3RkIgsbk9Ir5QTWS2upsW3VYdAO9RoPs1X84R
         FeD4AXr0jH3Rng3zqFemaTOe5ZqXFGaKQQXMbceNE3EUGnMaPx1H+dz90Y9ff5/ZtC1O
         myM5FMfBrRrVJ8ZBWSLZbJg92EQqo1PW82kQnejs4qgMChGXysxBtmFfELSPQ6pgRJ2q
         uGq6XlET2qvdgJGEb96e/uLJzKqC1IKTtcF5+106bNcLzHfDMzY5l3XobyKdQbz3ClYB
         u1KfiHFCqDLZU3OwcVRYaGETYuObiMiVuytYWj0Xa1c3zaWc6i+LWr2m/d53q+LBRgfE
         afvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z75xzDza/hooSCAJFqk47whifzAJZg7dX21ijDhOozU=;
        fh=fM4ZI8+hWSv3Fnbj2b8tQ4LUMCJe/yK27MRsZNxqW0A=;
        b=CGzSIO6nFCCC0wDZ5rRuuyZyatEHnrwF1bk2fNMXabkY+shNYbkNxioWDNnXfTyNht
         2ZSBBvXfZkQ22jYe+Wh2POo1jmF5h5MtEF615/iYDRI7bPAC2GW6LDxGXVQ+iwCz0Vmd
         +oPCQWl3FjM2CiICDQnfaaG34ZtsN+O9fDXYiJAJYSpOd+lm2Z7TXomuvEnmntHpti58
         0g+KHXvz//tujRpKmscFR8HwEeoMwxwhncLEWgddiGft2Pu2w9wbLeQujapIo6/FTWNh
         N119haxWlJh8SGWHWCWt0HAGNINqlgBLsCUp6ttebrK3ch9wKbmy5mjmLX22p0yu4zm3
         uKWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285412; x=1795890212; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z75xzDza/hooSCAJFqk47whifzAJZg7dX21ijDhOozU=;
        b=eeFJ87Dj4gzRbWJ1dhzz9Ae38H1olk1PNIoc+W2O2fMNtkKGMSEsb9GYF0xOVS1eUo
         dYw/fQwUusX+96dGoDpyI2rfr6t9wxk//m2TEh0mZ7kUb8NMTpZ6AfK1eLEQSiwystmW
         eS4qSKfXsNY7baDYaOMBBTOA73RbTF2ZQci+1OnPjrdOxzh0SqTF2LoRWit0Xt4W3FYf
         gsa9MbR7LR5+Sdp1n622uhQLbeqfnpkyWVwlmrFrFuFCRij68RKnEHKh3NMnyicl8r5G
         5vPSzx8eOhFHIV3uiLmhdrZG0FTnj+KtHfObuyr4OHv4RHeyR87cgBdi0L2NywmjkBOm
         +NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285412; x=1795890212;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z75xzDza/hooSCAJFqk47whifzAJZg7dX21ijDhOozU=;
        b=WdSug7+yjmsCRWl3Ysz6w/nSgSjeFtN3K/8WidcCMvxIhMI4c6L8LdudkRuQXKE2qa
         d9Dt9evgkjB9ZszcFzSQyU8lAek4o6i3Yfxm1dNr9t4uJylPx8CVu/ON4VSowrvevUKw
         CHw/iyTCI0Py683uDJ90wTtZQazGrM6Qr8OtCY/czlTE6ETA+U+DhXHiCYUM2zK9M0JK
         K4aM2L9u+Zd7K/iKy2aJCzs3eDo6gJJ4DWlC1gtOkQ4g+10dAlvSknuPDU2Elv8f1gSu
         aRDAbbqKI7NUn2rLOOJaal1vWqEvkP7BYQ2tRLNbyXxEXvpkByrQtbjha8WKN5wI6uQK
         DyUA==
X-Gm-Message-State: APuU4Z9K6nQu+mjTHaX3hdi3hh5WqI2vA21NeTyQ0bb8Mj1PxvFkbtm1
	qIGxf97wg94TehUg0wqgirEi+kmYBxcJJIz0EX8CSEHc38np+zITGXaUY1CntDlMcHe9MSsLlHl
	YVV4QzuRgArL//NKqMwAr+lchrlVstQau+14qHkk=
X-Gm-Gg: AZFdTZeO+EAgtfv/Pj/Ce3mBuZBWDBU0f07QfFjJN7EPmK7H49jTG0IYEpCdz90FuV6
	3hh/hnOPfeUeojcgTqJsp7hUmr7WWFtOz6KtH1e78MUpv21SILMexxT+75clgOYaHlNxhD2GxkD
	MC4OJ7zt1+5ReKqhB1lD0pME0QrWqpSYbyqjN/cmYtArAiogVXeSDg7S5dhxkUAtAuZnUzGbDQ5
	RZf2oaCFHs7xb0lmiVM+AxwYiybnwjexzpWKmRXnvOc+5Rczsogx0NjjzoqcvWcN+9y3VWk3dfH
	UvlZHDRrzDhttboKfkxZpeP14ivF8u+clkLoyoLJpB9eNbs6tokQcODUCH/z04r5m/l5sBER4Tf
	ra9XPNoZfcatXwOU5KL343UwY2HCqudmIag==
X-Received: by 2002:a2e:bd06:0:b0:3ac:e4cd:d824 with SMTP id
 38308e7fff4ca-3ae7fa9d43bmr17398791fa.25.1795285412132; Sat, 21 Nov 2026
 10:23:32 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121163915.86681-1-joshuacov@gmail.com> <sashiko-outbox-227181@kernel.org>
In-Reply-To: <sashiko-outbox-227181@kernel.org>
From: "Joshua C." <joshuacov@gmail.com>
Date: Sat, 21 Nov 2026 18:23:19 +0000
X-Gm-Features: Aa3M54oMS3zDmX2jTIQjP60yw_5F2PR36ANEnn56lHMZE1_sztKVGnLssNfJp44
Message-ID: <CAKL7Q7p4C_Lmpa7RE=ERBVRzynNGdvhHMWzsvhe_ZC0v_0s_1A@mail.gmail.com>
Subject: Re: [PATCH] clk: rp1: allow the clock provider to be probed again
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Clearing desc->hw.core and desc->div.hw.core for all descriptors before
> the registration loop would avoid this.

Thanks, fixed in v2:
https://lore.kernel.org/all/20261121181650.143474-1-joshuacov@gmail.com/

-- 
--joshua
