Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B174A3EEAC1
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 23:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787009093; cv=pass; b=Fown/eI2H5LmBi6AJnB8KhR5nvE+3SUn23UVqmh6tHHRwxYdd35P3yCeRdD6pUV6mIoD+quOU0kNqNWkT9pQVpPhOXimwttvIxL8hscHM1TyLzCVPKngJMJjcBs/04GEbhCtbKBuL+SMAIOST8l5kiPcUfTp2UNjlfxW1iQ9mpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787009093; c=relaxed/simple;
	bh=EIYXnjCAjNr4smxO9uOZzqY0HcNX6do2IlpDo8+jIR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+23zwFjodDQLf391O/EUYf5S1RpZgCP9TnnJ6eHT8znaCejLaO27VOd+pYHy+6kIU7E9hSI/OxwFdPlCjEm1tjDGqWIKp4GB247HNuxzAc4P3+jebQ0bRCrz59kTp2eu1+tiumJl7Gf3iFQyuPtUvwrk+9xcFykH4yoDFB4rnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsUoZdXQ; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsUoZdXQ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a18ef236ecso872069a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 16:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787009090; cv=none;
        d=google.com; s=arc-20260327;
        b=fSQo6yxe6tDrtyXf15eLnU3Z62EHSjfYf92sgVehksdtInceaCT/nShiHPR4iEE/GH
         WZRRCJhsUYv4YAqnWZ9RdX+bg2cMHwtnRe/CPoYC+gGz4X3Ql8z5jo98jnLp34pZOKyG
         lA6/ArX34b1Zktqwzh75PmGjeoefT1skZ7OtGPSF4cnGkUqIKEVpxO+Ss41WI2/g3DrO
         WIhSNjKqVMB9ziKE+uDWHyzhdGQXjOUbCSNJVqkyEfkBcHbJYqCC8HdF+wUhUSeFQMHd
         LTIs2V9A2MN9pqV1RYimlTn1CLqHhKJeecyu+dykSZY/OAI6yEuMmcG9qg2pinWG4AXF
         K8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EIYXnjCAjNr4smxO9uOZzqY0HcNX6do2IlpDo8+jIR4=;
        fh=PNDighEnECkyQLstgN8Xf8nLfk9a4CjtB72gBLNIfCA=;
        b=AzFe4z/bILbjq7w6Vgmtyba4KOBVdWjs0V91ftvRUE+VnRQqKfwOxf5XTn5lgFRbVf
         e4k2T0RgxIEFvx+eRKLvaQpsTSFZnlDYDK8zHXH+vudkwm4x2+ZZA8mbv4aDF6AALnq1
         RfSTPonjCxEsPciVclmvCoaDbk29OLMnr2VEftn8ZVo0Ksc4ZbN6AS4nmV6c/vTwxRsJ
         3urvEtxK53tQ+e06wn4iFaXRj7boJXbbHgO4DdOaBJuclqE48qJvmzV+i1PyZNTOodDz
         Q7ZVB7UA77EE5nh6z0bTNUA2wo9BvBNhDJepAFRySflku0ID70C7s2BfLJSlacjP+Gt8
         fLmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787009090; x=1787613890; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EIYXnjCAjNr4smxO9uOZzqY0HcNX6do2IlpDo8+jIR4=;
        b=PsUoZdXQtwRiWGBZb/1/JnXtQGlpYicR3ZGKpUimcbBySLti6TNwOnBeL8qJ8Z4pvj
         pKZXO5QAKBEosahkCP6rpzPueOzFORJRvMSnmlsoIYeskQuD+aqRINroUVBpNOPV/ImI
         3bYHQ5eZYO6wmL6QS29X3Uk1QUj9Lutrh1gV445YdjlyQIiuiT2iPVseWXMeaYCPOjJa
         Il4if+iZ1qAr6F7yFJcWsEKXhXZLdS1AVBDYsIaVef0ejumQeoQMX7EKeP0y9dGw2UQb
         Dtm5fm/O1GoIxEBsnVMknSZyY3kxa5KjaThVU3Pu2BFhJBhkisPNV6//xhxzy8xQHbmp
         pmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787009090; x=1787613890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EIYXnjCAjNr4smxO9uOZzqY0HcNX6do2IlpDo8+jIR4=;
        b=kxRWXiAxnit36Th332Yc6EdO76tpKUbicnG+LQykv1qcr4rXxjlHU/niXe3mm0gw6i
         2J6fmalJCetJBzS0Y63qYNisyIejfuQTIfcFpHCJNMXQqofU60uWf2Vt2pbLIAn+YGXQ
         nmYe4z9yhwHCLHkFUhbO2p+Bv5LQBRvNWNt4fLFujG5itgLkrstPpLi4d0CsHSDs2XKs
         nhXHdKF+fE25KgNUuhYn2atQ5G1i63BZ7SVvPDv0jrB7P6cyfhC5AezHKtrbiXHGYze/
         rRv6Qn4CQJNF/24cy/HfiL7tkpsUW/PxUNy0KRTdIa59dEaE6kbuZWYFfcN9HWpog9SX
         bxYQ==
X-Gm-Message-State: AOJu0Yw1gJjJ2uZ13oNxGQ9LcM5cxTCJz9t7zCDrXKUl7bGzPyzc6gxL
	4rHMgpx0MEYDDcSO/QS6iJAPMIG0uwi34Di+qhQrDkcKKSvqiiiIlmkZGejXyncaSdNxwKkNynH
	O4vionAagiW7MJRDoH2CcpcJ4WGwMzIMjXg==
X-Gm-Gg: AR+sD11dcTmibneityPXSLd46S/DaRqY9qQvdVSNHT9DhEDZ7PwCNu9QTzt2P92QiZv
	w2HOa4g6dl1la7LUjX2UU+bdDi+oVWNgXzqRPoHXlE1DlEX3C8X+LVnzrz3hQH6qeg4So/vgeZ7
	IOAVyUwYgsMnqM823ZlS3Y6eK2pt8OHnYIZpN5RKU0YSsi1uZO56aqreCoHorSkEC+ptVZ32jWv
	WOBaJpwf3e/Mx24fGEm7KrM4eygl3HZTVB/rw0Qd2waYSmYY2BhTzL5UHQj9SpQt5dzEiaIm2rv
	gq+M1/7f11u8n0JcerEzcZie3wREDZ8j2FTPjSITQ8oNhQuWP9hVMaw=
X-Received: by 2002:a17:907:9403:b0:c1c:4ae9:b935 with SMTP id
 a640c23a62f3a-c212a22e029mr832073766b.3.1787009089753; Mon, 17 Aug 2026
 16:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
 <20260818-ti-am33-usb-v1-4-69ac5f92df45@gmail.com> <20260817215828.978C41F000E9@smtp.kernel.org>
In-Reply-To: <20260817215828.978C41F000E9@smtp.kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 04:54:38 +0530
X-Gm-Features: AcwNN1WTyBaZvgcQdpeEh6FbkgnwyFmOSVf8hYf16WKHI_bRxJfpI64Z7g1mdQU
Message-ID: <CAOWyW_4GF6iCzZ6VMbrPtn+gkgQe3tZ0U+WP4S1vJDsGxMYPpg@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: usb: ti,musb-am33xx: Convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, dmaengine@vger.kernel.org, olteanv@gmail.com, 
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 3:28=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The custom vendor-specific property `mentor,ram-bits` is missing =
a type definition reference (`$ref`), which will cause device tree schema v=
alidation to fail.
anything that ends with bits is already defined so no need for $ref,
there would be warning if $ref for this is added
