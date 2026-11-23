Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421201;
	b=qGJQEXi3qxtO6OyQhsbJrVVNDOX9LmAoaR5Wmuc5HH3Tpt/HDwiRPZUMWdw12fCeZMDs
	 fZmmCED9oF1J/XepkIoCFjX7MzoK7xQ03ZyXdFArcKDX+A6x3cPrzWO9pnJOGk+xA3DRY
	 qdrQA3i/FuEHKh/zL7nN95RCjY/RvsxYcG98JBc0hlaJipjVw881Yrxida70C/rgCpuBa
	 XJkaZ7eRancV8m3Wl8lkYW9Te41I641xGcbw8iSi2QRV89nn6wLWQzwqyoh/mPkbyJuqe
	 CDFtM2EvjbQPk39elpkkfJaA2w3O/V/ZWEpRGLBrl51LHJRRcZr1VDTSyaTUgAgewkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0/cAHzp2byEXTdt5JI13O+MKxbnMcLe/w5DVxG6Ogbo=;
	b=u32BcTFFiWg06pNluRR0NIekwDnJ7QvmNJyjQDjdm/x9/lhL+7LBt8ptagmJYL6RibAF
	 yeN6U6SH2QkDkrzMDcXAP802ITR/yj1t0hnQffNyGilt9rhFD/ey1HtTWIRmBu0qPtsPl
	 XajGqPcvAtCv2mCDfcTXQtnHzhEnGMFSZk1ZSajzZbLDVKQB5lBQ4lTT8pS07dbWmF1pn
	 8Riyuio21U55S1XMdVDDyPpYD+xJ45ysPUU73C9B/dzyNSZmUzgqApZ4+bZw6aMPVkajF
	 SwKjKoNIemSKz+/eLZ6jHRiatR+49Cx6UcOmXw9MFXxn5TsLo4sQoJIRQ6KIdI7o1qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=k2eIG77R;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CC4607150D
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 08:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10CC4607150D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=k2eIG77R
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so20467195e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 00:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795421199; x=1796025999; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/cAHzp2byEXTdt5JI13O+MKxbnMcLe/w5DVxG6Ogbo=;
        b=k2eIG77RWPvcto3zo0Dx3hR9DS62ingnrbyxzR/NzVjMsN5qs0cNvCfaHaUt7No2uB
         +lzx0ZWUdco9koEiNIXkmZHS5c8RMG05V/WcUxvrEqhGh1S2/0C8t2xFkBigfGv7UtU0
         oqH2Sq1hFZvZvnP0eDfURQpdjzKIFXS/IJwodRsN8uNJGkxmdOjLV3eadmclEM1MVUL2
         7lziSAVQf25OcEJ3f1niMqgPvN+aTx3wEnkI66Z4TkpTymEyEEfWYpvJpHJl6Yhi2M6x
         kfacyfnqur8U1zJvBTjvV/lc2qsx18ILF5jUmTTn1M/nLkHebf440KZXo3FDyZ0NISqs
         ++6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421199; x=1796025999;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/cAHzp2byEXTdt5JI13O+MKxbnMcLe/w5DVxG6Ogbo=;
        b=SG6SbiatO9DM5Hipyg+9SyqouFxc5GDCxxowW//N+xL1vhE+ePmhqVLCCd3zemWL0u
         N1m23ivWPkQXnf9xaiU1p5TVopnfozTAvfsmDBxPaaGfSXOkK5Ax4KVFeJxYJ7JQyoVr
         3IQz6zmO+SEcSJAT+onrLZ51AZxHDXYyQzFDbzUSY3y3XBnrMUPDQCzn5olNboXvt9eV
         z5Kg+VtcEhd19hzzHgXO3kcdUi7mptX/MYAUuQ+yfKgvRR6HN/6nh7B/8LBQqKOIK2gY
         1PtUOkMXm0eOpbMDsPpjf6qcHZfeR2eYIovDlAxnPMcl1WMg29LwO8KHu9XYCx+gwaw+
         o80Q==
X-Gm-Message-State: APuU4Z+Du/ghzf/jIperWxIStMh2CFqjOrphLwv3iGQxQN5Hf5hqfQLy
	Fbg0DuPH+8US0FCyYC8Rv+NsAhVUJl2nhp23E0EUQ5BlOcj9UR0P1nr5Jk4ke0Ce8KW6OBzVlgN
	TSzgXmP0=
X-Gm-Gg: AZFdTZfFu8nVXKNq9k/h02kUfCZd+Xryv68evXPx3wWuLCCpTHTnuFA0d9VM6QjIWER
	lcbI0Bs40/OspBa6c8/sF94E2YEBxnAHdkvZc7FcpzdA/NNueC43D7GT5Hgz6SqUpXhcDTYY4sa
	ib1F/kUBVzQqb64655NPrn47Pgwf5HRvt7s3nnw8BAp8D/WtPY8q/HEQigl+cei0iGcrE7qrP3F
	mbVJo/CJMkWjEtj1W82eOH2puvF9IQjS2MxTeLBew9ZUm1zhSPBS52Grjo8O9q5WzqceN3j4Vl2
	e/1A+7/lzY/TKQxi5vAkwTlCaFnzSruyHAOq99E8KTwDKvod3syCTmUrJ65HIKw0WZW3Xa/FlZ3
	RHHBm0KD2kEUwin3u6PvOOU+82+euId+h1IVVEPmd+HLPIMikEaam5g4MNPVNlkDSUsZqDxVfLB
	h7PmxVETj01OiuathUT/SRfvjDxuw2C1JVo+T6FPZMfwmKIITV9vNRSVPNjVVHtUHykv5zbzHcv
	X1u2IMHziT/A0PSntUN6HbA9r0MuW3VMNqWNGWN9IJq28LvZQO5qPeyo1KNCc2zBhOgiMR8MIP1
	J49oaJUsSMAO2abycxaIpte2k3tE2B9wC8cqxpUp2kn4RRrJfNHZBsypsxFi3jK91VtWabqHM0D
	D3BLHLlte
X-Received: by 2002:a05:600c:c09b:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb8880995dmr161630505e9.10.1795421199031;
        Mon, 23 Nov 2026 00:06:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:121b:474b:8d1f:a239? ([2a01:e0a:106d:1080:121b:474b:8d1f:a239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm360424565e9.8.2026.11.23.00.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 00:06:38 -0800 (PST)
Message-ID: <2d8dd4ba-26ec-4b01-8361-09e6dfcfa5ed@linaro.org>
Date: Mon, 23 Nov 2026 09:06:38 +0100
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
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 02/11] dt-bindings: phy: amlogic: Add Meson HDMI TX PHY
 binding
To: sashiko-reviews@lists.linux.dev,
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, olteanv@gmail.com
References: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
 <20261121-meson-drm-create-hdmitx-phy-v3-2-f8f471788076@aliel.fr>
 <sashiko-outbox-227302@kernel.org>
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
In-Reply-To: <sashiko-outbox-227302@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 20:26, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: phy: amlogic: redundant word binding in commit
>    subject
> --
> 
> commit fbd4563b5cd10db3f75db052197f808e3b36bc55
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
> 
> This commit adds a Device Tree binding schema for the HDMI TX PHY found on
> Amlogic Meson GXBB, GXL, and G12A SoCs.
> 
>> dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
> 
> [Severity: Low]
> The dt-bindings: prefix already indicates that this patch adds a binding,
> so repeating "binding" at the end of the subject is redundant ("dt-bindings:
> phy: amlogic: Add Meson HDMI TX PHY").
> 

Use the "dt-bindings: phy: amlogic: document the Amlogic Meson HDMI TX PHY"
