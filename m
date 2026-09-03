Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DC023D7E3
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427089; cv=none; b=kIR+ffC7W7O9uWvh0c0qrOrYxW7o6GSePkev4N80Wg4zQckBq5BYSerk0l2CU2I/PvfqISrQO6iWXzQrco//k8aKPKSVnGDdlA+rznlbH7Ik9uoDHaPuYn3IUkCQ8UxgxHJ7UhkNccrj5wy8HP1wUql/ss3syxm9Jp/szQsVmTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427089; c=relaxed/simple;
	bh=fqq+mlUYVSwI/JzFFvGjx7+CV6yF6ELV/2oP+1IgVpc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UWBZFYCUhMZiv333H9rzi1wHfSl67gUfnAZQExbtshImlyTeiF005J65G2n4DHvtVQKkLQDuMM83yUS/1LVzuXqaXlhHYH/s8YjUDiuW0+kNREv/4YH1YUGv4QyYorkDgAu7iud4/Ou9o6BYOL5Z6wdqt3JviFj+6sAAJOu7eZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PyM+T+0F; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PyM+T+0F"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso260947a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788427085; x=1789031885; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RADmv4XaLcIGOhGRtTaSCZnpqOtQ4Wu+K2frfCCUNZU=;
        b=PyM+T+0F4izu6W9xeLWzUzQxtZqEVjYwYP/WKmQgtSpgfrLAjYMPhpdo6acDTwqj7B
         GiS2pjvhedG9BXdNfzoqfjctmnX40tKhVHs7S1e1f7Zc2jFOp3TeLYaw22RDa2Pne2a5
         anvAnK2s5JgItOM3DDGusWGjWRbfx4cmWqDRrokSOUFaj29nUr9UBU7TbJECQytr85A3
         7Ibba2Pc2Nc+bpdbq7lIxqYszSQFA1wNy/pHteOpkm4hJnVTYdnUJvd4vvLmIzoeto2n
         9ASXsvuGgHFckUdI3DGz9DfDV1Gn+bXicfa5qfX68ARGcp3KtleslHYwb2UHNWH49rcP
         3LrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427085; x=1789031885;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RADmv4XaLcIGOhGRtTaSCZnpqOtQ4Wu+K2frfCCUNZU=;
        b=f5Va042Dm0N1Ey1kewId2dFW03VeoI/3jEnYHZM58nI4bBP+oEJxuF5bEOP4Qjlszt
         RHJKRAnFHl73h3pa3vhXpPd0TF02nigOHG4WiWX4pei4mD2Nb7rZu+2odNeHudQANbWt
         yW3amIgTfd7q+rMhA7NlDVGTwLqIC2SvtcgoS8V7kyYXq1SiOKxN8sBpObjLmMSm75ph
         rtnz6XTrtouNeFsdB0y46YEL5cxIEwMdlEFpmhn/xiwC1mxRR8oTBD5OsddSjakblTa0
         Qp4e3xf/6m1PZUZ7kx/S+FNNH9wYMMWBcTbHucIeXu9rpo9EFL4gq3zUGIoRv0gcTyWS
         gpdA==
X-Gm-Message-State: AFuF++lX9LX5yEPFBUdkZtUZhqYUl/X54ezyCDhrTI2aA8dy+6SnRqJV
	7quQaUENE8jx6xg/s93j/SYDliIhWbJItgl9cF/dKNAHG4/yZV9IVHK1O9gl990DhINfNl8tHGD
	dYyKsJJOdsA==
X-Gm-Gg: AYBFou3NpnT/XiP944K+IVN68YsAGqexTPI7JAfFNbhJVye0tPFU+1bVFP9ItCFqBDv
	PxJnCJ8ka9tJHAw3JDXyklUlnPmppRUjR8eE3iygcaVMkzGhLbF3sNaYl0hLMvXQJ0URrVZfK0B
	qMuK7uteeeZ3bEYuvBgGn1yY4MKJEy1Fuoq1xPJYCUejKtdpdeRlHbEU8mPXYn7/ozWHtHTAGDh
	7RpBktSVa21v1TqR2TLXxMow4fUiBdAa8rydz+iPMOnc6ls7LxUySlpGbgtlDUHNLEQl4IRfHht
	OQFsEt2Ao4Z14WhxQPzehBO9xJzixt6LPVvpLWQ+W2BiRCtMSXv+iLo+agUHxm0LIFRvWF/MawS
	Al2FV8c0mVCG61vpOnY8I+dsANtgvtR7IrpvmSBlWvJE8AijyKt1I7wKWCsZcyMZjxNRscOzNSg
	KoyMtEwgfvMYBAO4i5RSx+iG+5WnHzIvSS4h/Q5PgXd7SNUFUfro94cqVkHnqOGjkeTQ2kjTdgM
	CdAD/x2NSm2fH+HiBct/59niE6fLM2RJj+EmPeIdxE=
X-Received: by 2002:a05:6402:52c9:b0:6a5:f203:ba4b with SMTP id 4fb4d7f45d1cf-6a6832e4e4fmr7309118a12.16.1788427084433;
        Thu, 03 Sep 2026 02:18:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:bc03:561f:5dac:f48f? ([2a01:e0a:106d:1080:bc03:561f:5dac:f48f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f932bf5sm2126098a12.14.2026.09.03.02.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:18:04 -0700 (PDT)
Message-ID: <0668e09d-3596-47db-ba16-0d8c053e74b5@linaro.org>
Date: Thu, 3 Sep 2026 11:18:03 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: sashiko-reviews@lists.linux.dev, YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20260903-mibox4-dt-v2-0-fbe7c04472a7@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v2-2-fbe7c04472a7@stu.hqu.edu.cn>
 <20260903085901.9CD541F00A3A@smtp.kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260903085901.9CD541F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 10:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Makefile entries are not alphabetically sorted.
> --
> 
> commit 70cc330a6bc43bd5cfd305fe463356587a2e4a7d
> Author: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
> 
> arm64: dts: amlogic: add Xiaomi Mi Box 4 support
> 
> This patch adds initial device tree support for the Xiaomi Mi Box 4, which is
> based on the Amlogic S905L SoC. It enables the main on-board peripherals
> including eMMC, Wi-Fi, HDMI, USB, and audio.
> 
>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>> index 57bc440fa55cc..9f357df5fc54e 100644
>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>> @@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-vero4k.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-s905l-p271.dtb
>> +dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-mibox4.dtb
> 
> [Severity: Low]
> Does this break the alphabetical sorting of the dtb list? It looks like
> meson-gxlx-mibox4.dtb should be inserted before meson-gxlx-s905l-p271.dtb to
> maintain the correct order in the Makefile.

And the name should probably align with the other dt names and align with the aquaman name (meson-gxl-s805y-xiaomi-aquaman.dts):

meson-gxlx-s905l-xiami-mibox4

Neil

> 
> [ ... ]
> 

