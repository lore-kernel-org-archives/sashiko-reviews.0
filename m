Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC46A3F1AD7
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 23:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787009156; cv=pass; b=sTgoCl8MaAzmy36DrcIlR48tP0SSgrM3p39ihQM4hlNc5fTgugNVw361vNLMpnWg8wuC9G/0/b+VePV+hFsDnqmqLOt8z6zwd9ZethxJqrm4uViLHltZfez8hvXOAxD65lJQmJ99TX9ma9QmQHzhoQ0/BYOQVKXDG6EjLrTSRzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787009156; c=relaxed/simple;
	bh=g1AzLZyhhmggt5mRW1QxTaJqgkbHRAIppDxF6F5qNoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ChXT4SfpNoBIFAwrH9m5vz8sV1Cp5FWPzsXzV8An0lkGPy9Sv7gl5QFglJT/zIzrFu9IrDk2bOABfO5DrJiXdnFfb7QSsjt7oaFIc7pHLnjz5lJtvZeLkQ4esz1RsUAN6VA85a0F/Rb6AgLLvPCmeWgG1frZ8yRM8CBQDzEqgnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlJ5RG+n; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlJ5RG+n"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69f4acf7047so599671a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 16:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787009153; cv=none;
        d=google.com; s=arc-20260327;
        b=aPtWn0LPqR2QB7dMaW8mMDq9Dq8+5FVwURGzHXgUoMf+OpRe+18X+02SBfTi3YpJfY
         JZ5AMweflDAXKAyvsiFWX8LaS2kLXObmNSxWcR3LAULL9AJwu7MTRKNnRl+X6himvKLJ
         RfCvAnlDPaAvjkHr1nZFS4WIGwVhsR6sKWr/aDdwx2i5Xtip/nhQjA/fyHrTf7nufwen
         K1bmkBX3Xc07Gn+hiXAtaIWTRefkg2yCGDtmAx/0b1YsQJyyyIOZBMZWqdt/tvlhWKCP
         VgYMJg134vSNzJx9aUwBPHdpdGoLeyt8HYAH0I24xVXPGc37XnTVmmZvwR0lrkQ+ei0S
         WNcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1AzLZyhhmggt5mRW1QxTaJqgkbHRAIppDxF6F5qNoA=;
        fh=LfhIsMy2TFYyKXgVJC8+0nreGl1b+zLnVfa6kvKETVE=;
        b=DQ6hFb2Wl5+DEfDJm50xwUOhX77W7OcNOBjw8p5QEKMMW7moWLG3avWQs/uvT8kaVj
         BOUG0LkuhUPZXsQP9EyWrg51GV5FOab67HikC+9GUh3kfxSOnRZGczO3cvOGg8i4Vn3x
         WAd9d1BjJBmvZ15sPOOv+fawglFMRX16QTGo2Ru/LQaR9IJesb2WvMBFLVe9kDU+tWlA
         RAAHE8ZCKTZqNfXT3k3cRFcFf2gtT/Cr1p7Ow/rhu7qkD5+p4AUi6GXTeTqbb4EVr3KI
         psXfnQ+7vFjWrvOfS90UCQ848Kj9XCuFWJgkyFpLvjomiLa3mc05XMWjzCmp8puSyyRO
         A6Dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787009153; x=1787613953; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1AzLZyhhmggt5mRW1QxTaJqgkbHRAIppDxF6F5qNoA=;
        b=nlJ5RG+nDYWVe41q9FBE/68Iv8uAj08KrvUZ1nRI3FomxeVqGO6G7m/P9WSofon//S
         kI7B5qotjxqOB/NQiwtB8mrWp/8D+Cl5PFOrlq9U/YtlEcCPrXzwofE5dW+XAiI0OVSV
         8ot/wYVVayVwtIR0ktTIPTO+E1/CJMSUhS4LfQ2CI3aTMDBO6AjbC1pzTMapqXLqiVk1
         0IZRMzPAKq2JndTkaYbnmY2mVmi1759SfZDhDHzEyIxPI4W/QDtoq/K2VSOeQAx+Tyyp
         809Q+kwuyKSnHFt4qJV7v5tFpV8Q6OHSLbRHRW8EMkbAENPDWXFg9pC+72ipPkLoTgiL
         ONQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787009153; x=1787613953;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1AzLZyhhmggt5mRW1QxTaJqgkbHRAIppDxF6F5qNoA=;
        b=RaW5HIzkTdqHhVwsQH2vP03xsbLg7sPCKt3wv1do9XyF6BAerna+7StNr4Z4+vnqy2
         QSlWsudS3vlRBrW7lDPwzcXDxko18/DJS8vjRkjifYgSq5lu1nKA1y4+EVrJvDSxo9X3
         Fga9fLNB7Tk+Xf261b3RXCKt9T0plX2JTYjSAolvlS97YxB4ZgVbCAijg+ubEnJES2C0
         dkqcCZT06/i1VhtgO3tichbHejLS4bQ9k2wy+LpEH5REMcsrshb4fAI86DOC/hozw7WS
         mgiBP0zHjlwkWk+9FUMEjO4/94Ndn9dn3BxpvuCRRtJLmde9sXMv0JRlk0g+iv5vUBMC
         SGNQ==
X-Gm-Message-State: AOJu0YzVnK9glTbcdVOhnWXWD/DateLR4r2mpw5CCAAyG9kGDEVyoBMN
	NuMpxJeOdJ4dPLUNhJJM46bqXWpZ1hhLXjt5gPcP/dTeuECA7Cz+ExK+xzSx4F/NzahqRIJ02FL
	/NKYsvLCc6sgHt5+XW8nXdatsrPfZHSR4xg==
X-Gm-Gg: AR+sD108f+PJrQLzxSICvsC3foYa3bAh6aOGvl7D8TpQYz7G3ihJYU1kNoo194wVJSN
	08SK/DPrwLgihhFTA/m3NYxVACMd2Nkid1xNMFuZOhk/WVAZpduXkWad9ng1TPRyAzwWGYA5trV
	IYHzGa8s25xolxil2bGII8j4nWXS0EoGzgCjZVPKoKxCAn7tY+zK9YU9ee8dlnNEgrjbo/isJaP
	Xgz/6x3WwCwg2tmQ4xtT/bAlvGjmxmr/ZJUXxscXnAinEETvkZvnR0x1jt+4792geYQFxG+rakW
	W00m6i9HoJsGKteLSQ+6aozihyq3oJ479EaNnbdL4fC2
X-Received: by 2002:a17:907:c1f:b0:c12:e4f7:9a0 with SMTP id
 a640c23a62f3a-c212a17c930mr646591966b.2.1787009152807; Mon, 17 Aug 2026
 16:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
 <20260818-ti-am33-usb-v1-1-69ac5f92df45@gmail.com> <20260817215829.AB4321F00A3A@smtp.kernel.org>
In-Reply-To: <20260817215829.AB4321F00A3A@smtp.kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 04:55:41 +0530
X-Gm-Features: AcwNN1W_ixQgq_Zd-BIBGZqubOpNe4fyzSrpTQJ0Cu1HvNeHF6H9Fw8rcF7uO0c
Message-ID: <CAOWyW_4YmQ=Dkd9Wr57wxCfWJKmFVOA7BL9fkTiu7NcL=gFFtA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: dma: ti,cppi41: Convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, 
	linux-phy@lists.infradead.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, 
	olteanv@gmail.com, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 3:28=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The newly added deprecated properties `#dma-channels` and `#dm=
a-requests` lack a type reference, which will cause `dt_binding_check` to f=
ail.
anything that starts with # dtschema already defines this as
single-cell so no need for any $ref

> - [Medium] The `interrupts` property is strictly required by the hardware=
 and driver but is missing from the global or variant-specific `required` l=
ists, while `interrupt-names` is required without `interrupts`.
yes , will fix in v2
