Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425828;
	b=L3A/l9I0mLSwTkODfmegDRmXzYZghOwqBVnW/8Z++Ikl0SJtoL1llAeLFYxY2BsbiLze
	 3itkeCJw2y44fAdoDFNcA+yk3aVXMrl/8gLM6HU5nJV3BeazmfJJkz2au0E88qp350RZZ
	 YO3B3pkZDSB5DRJr0r4b9mZll8oQ1o/pKRpfPLz4OQNKLVnmO4zVDq+AA5nGxXCjY3BwA
	 p+ECa4JS9RlJ4yXZALyRSnqq8Rie8Up4q9k3c8RAKaaYW+YQwNmdu2Su9iGbHLkuH8O2E
	 kDHxQy+PeL/uifljLdBdIju5Z6rEdnqq7Cuo6rPhTAJ1IfCrdSEpK0E+COANb0ZagZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AM9kxz713dTdsxCuaiBsVAi/hw4sJhoqnaoMFIihNhg=;
	b=P/19Tvge2pV9Yf41fbC6y9jJx1n1a8uWKtLnKpNlqWdr+i1U3kadYTb0JZoSqbSKtxrK
	 uLYuwIvXcXzeavusNX9u3d2ZepKxT6zwt0EsWFZYdMR00BhcBY0w37g5GEZyKMdF3jDcs
	 nJLDr05k1VotBluCT42TynDtkgVrU4qRi3olJZGuB4BsBXlLNa8yH6VdKtMIoypT0B+EO
	 Mk0bMexDg8m7z6abITpDy3XKNnH3MT22QSjEXyhVZsUBADQdiD8G0svmj33Fq9bkXK20n
	 A0nBrSVOdYxXJnJgem8h47R696TfvessDe2gcZlRptJpWCTb31nCs/L2qFLhNHK7g6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/jofbsd";
	arc=none smtp.remote-ip=209.85.210.66
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFB1606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 19:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CFB1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/jofbsd
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-846566246e8so137891a34.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 11:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794425827; x=1795030627; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AM9kxz713dTdsxCuaiBsVAi/hw4sJhoqnaoMFIihNhg=;
        b=m/jofbsd0ab+lCUPl55ZbnYfqYfOZI1kiNIhjE7LQkuPEsGmyd8w76VCiYwLHqPn26
         qxM+nEKAe+zl+kZgwHIlCgF+kcSOzel/OtWAInthdQe7F2p9yjh7CIgdoqRC5ovAsT3R
         2NR9rvDsMD/bik+pv+1oP8VSU3PL/rL6P9U/eEn/b9CiV1O+LhJ6XzDjwfiO/bUcYWbr
         HZvgO6zK4uQt7YDxrvr2Bi2Ww7EiAfFVCaqbfgshLew4BTwhriYI5Vh6vPDQBtzhBcDv
         xE3JuS5GAUzDrv27HrTgpO+acqvZpjtwCRT+1hT7jEQ1hROgQUwUlOtfvhoshFqTEASz
         iR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425827; x=1795030627;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AM9kxz713dTdsxCuaiBsVAi/hw4sJhoqnaoMFIihNhg=;
        b=KbkzpLPooAmotRciJCoPbfrlLE6raVRnGcSBVjV9kCq6yNw+/D1NpIxf6vttFCP+wR
         WYOYR1AZio0J6bNRCXOeiAgJOMVXNuWLguGXfx56sx4nLR6HyiIeCgU85aF0VZ0L43wI
         7N45o8CFzgaCm28Swc5YR3PZQIS1iudFemCjhvI1PH0UqKVS9V77ieizecV/aYIGARGj
         9by3UlnF9ceXTpx0AaqAp7Jwrgmu0djnFXIbrkKll9/0jtnFNfUT3bcS/Wn4FJzQmuDo
         a2PSi8XIucPwJuyfyu4THb3Fv0DpJQ8zxz9SmtArkS9yQ3eSWkkbGVtt78UqRZCYcEJL
         bj+g==
X-Gm-Message-State: APuU4Z8g5SacUHbKagDwGtcNBC6tuY/jkWvdVqrEkpy/vG5NrFc/o6bD
	GYfV6li5wMevJsqLUuiKZXcFnxxMQJifiTno/cQB8m++8ACyfBhVhJ+jtFgjRT/WTWA=
X-Gm-Gg: AYBFou2sSytLgUbjVGd02K3CV1D//pajtbEMFzoi4mY0c6Oebj1vLHw+6CJxT5TuAot
	0OAKU1tAgIDo26aT9OiJnrzMtZwi/Rzj5MSzvWKlMVmnlGRSKNcm/l3JafO/A+J6HkSirKKqaiD
	e4R6ysNNNtFBt6MBNElcN3HwrhQjiypWfxPds/Yl9An1DcatZuG8efBSphUaM2u/n+d9GVSH82n
	4Ulp7FSIRre8093UuC52OoV9EPkbeD4cBO/LFbFDZUMzyR5XYNb6GOORLYyRcMfqkLJw8SQqKdn
	TADnOoGZfcawYD9n/rKwy6IlMCQOtXsPe3vldMGZQRozmtbnN33W6syfUm77F6w8irw17kaM3aP
	GmkYIy0Heay7d+IVUDgC6+icH0CvjvSb3gqoMzx20FAKcJTacVWdNHQxRF4TvOKNpGBhzm5Yb4x
	1kZ+a5Xec7ZgSZSH2NXZilgKZJrc6pqrbN+xpKv1armII2zxQzK9ldXJGrr67sv4/ochuMEbP6N
	WDwmG7+jV2KFzG8k0l+RueY0UKsmHfZ765uzV+PbY6o/JYZZLWLv/W+/R7T0JUnj0re8PzeA9E8
	q/dNXnoohH7taRHRFhQQlrdcwS3bgdfZTE4g/s0uR8knYN3yLSUBkOGnQgATsmW9OnFyqO9hwRe
	YX7GAGrnSEtr6L5m5ALs=
X-Received: by 2002:a05:6830:6d2d:b0:861:54ce:a344 with SMTP id 46e09a7af769-86154cea888mr11927a34.20.1794425827170;
        Wed, 11 Nov 2026 11:37:07 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f7b4sm5095536a34.4.2026.11.11.11.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:37:06 -0800 (PST)
Message-ID: <b005af5b-96a3-47da-b53d-5dd034b6d56b@gmail.com>
Date: Wed, 11 Nov 2026 13:37:06 -0600
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: mediatek: mt8173: Add the keypad
 controller
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
 <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-3-77b47cdea702@gmail.com>
 <sashiko-outbox-209542@kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <sashiko-outbox-209542@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 1:14 PM, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Should "mediatek,mt8173-keypad" be documented in
> Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml first?
> Without adding it to the compatible enum in the binding schema, this causes
> checkpatch.pl warnings and dtbs_check validation failures on MT8173 device
> trees.

The compatible is documented in [1], which is queued in input already. I 
couldn't make this series depend on it because the keypad binding as 
posted didn't apply cleanly to v7.4-rc2. Hopefully this is not a problem.

[1] 
https://lore.kernel.org/all/20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com/

Best Regards,
Ryan Brue
