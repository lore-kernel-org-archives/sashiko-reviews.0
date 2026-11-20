Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172029;
	b=iRKiAiZ+6h6bJLcoOk8vZJ0/l6eLu7oh2vETwciPtdXOXuNC6S/HPue/VwFJJSbl7CLw
	 gerhKtmbSOConGRqVHMqhOkwbmU/YF9kgqIQF53etjzv0X5lV0S6vYn+dNi8a6/ewnO81
	 mN4yfV7OrEl8+P/uo5V0FAplDbJdQQVwQj0QNaiWKUBnB0upn6SHoN0RYZpbyIqso9TuY
	 B+vcp71H+lFy/GjIq6vBPuDQYuHB8b0J+5XfE6uP5GTQV/l4i9eXkSIEofT9vC9GemoSP
	 VtG9EK1yK7t/E4vKA1tH9dEPjm7eQgoAxZaWfY72ESWrhQMaZmPkpQBiG0GsP3wTc3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FJnbzlKm4C6sIS5fK/T5q8uENf1TqxKGjsvInIZZRsw=;
	b=iTWrx/pga1uPgyRYS2EjWz3umJ8AoRe2te32T2KnuwXTIQEgNUakd8s4yIonCNTmWnpJ
	 CFDaUEkFD2LdMaVo1FUY8X66dUAYBYcEXyGmTuP0j/SEvkDlOyutaJ5554EamPX0k4oty
	 OWl7Q7G22cu/ac1HyNSnUMH3Up8jHtzEqwZuPcbOffzq8kjOpNcAkBZarENj55y9JIzXY
	 wAli5BSHQQRPCdo6Q6PZPoDtETHSS13yPOd4aJC8fpSPjyN5ts1SiXAnGj9JNPD/nhTAI
	 bhtxap4DZSm+EzHWd2NyG4JVRJM/w8N1UWIXFsVdXooOv1TPHopBNgim8blhfrZBa1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I4M867wi;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002DB606A325
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 10:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 002DB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I4M867wi
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so8749005e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 02:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795172027; x=1795776827; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJnbzlKm4C6sIS5fK/T5q8uENf1TqxKGjsvInIZZRsw=;
        b=I4M867wiqkv8F5Pvuid2e2HcvzOflM+sPItcx4osOG8BtQ/n5WyZtxk4pq9q9fYvfh
         q0IO6fSpyvvqNPkUKOY0yqu+hC+VLGLP6GDd0NB7WLxox5yK83iiHCp5kes+WbN8M10n
         n3QD3zBbjWONsCLjMiXu3VeHe7W9Zs1q/42QSKVcJFwL5Mc6ALwfs71aC0RAibf+UpGt
         qMRWz3TnRcFZg4ttqk3OnPxofVmOBWqFmMcY2AfgMs+T7PNmHsQDkF+ylsqC++Ozm9Px
         krLx4b+4hXjYNJWFYgXIMQT7sFLj/NZNLjFPywjWJao40cF+vUyNn8G6nkIzDJutPiFD
         Jehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172027; x=1795776827;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJnbzlKm4C6sIS5fK/T5q8uENf1TqxKGjsvInIZZRsw=;
        b=uNimovjUeo79omej94frW/Pb6OSd+KbbCcXG1UisoVCWI8K8yckR/An9xveBZM9egR
         mdDjiZN3+FZ4lOtzGmyMnHIb5yUWPukPbW7EfMDF57O9nVnVzKAiZ/+pCLkwXRds9gsA
         VZx9umMDqg1U8fK2M9g9j1yrfrp1OnIoH8xS1xdCt9Tl51sn17P/oSilUSFmpFRg73Wo
         /vkW9qWh07tWIIeXTlrWIlelWZuTSAW59D2rvLt9cgvR90yakRbLM/VW284xLZgDiQGF
         sYfQuoGtZlC1/yYAdxRFKsGFJkFU6i0mXizHjmuyVGXvtdNZjyvdtEKRgKa0k8U1HYSP
         H12g==
X-Gm-Message-State: APuU4Z+xAK5jp+XR/2tV32MYL3uULAK9GTr/QIfK6ff/pRAxUc+zARC4
	ec2aDLjorg74N+8WYt58rJMhxFNLsl1HUZgEwaCJc0B7Is39uJwkLt4lHkybXxwZ7v4+4QLBynr
	4Vr6Ec/w=
X-Gm-Gg: AYBFou3pepcqamFF5ak5h2Fc4Di9BqArV1m0Y9+iIahMtbs/h1WLA5zIzRZnixUnMpT
	MvmlyhCTBsJDIL9SExaQN6i9EzZtLueW95OIYlIgmaeNqUCXujSdjTHYpPXE7oduayElULz/6Z3
	7Cu3JMgFzlPQH90s8+yWTtFZeBcUnQii6G6r0Xu/1R19BXGkjepIV/RBv3OO+fii+UyR6l0aVau
	gJdjkrLiQx9GTKGs6a6aFOhUF4PaNoKXK9cwEPJOA44oAiD8PHfnjrWTr8WOj3vOiE9qusXjGSe
	fd0XJjdIxRhwAKj6PMt/RfmpQg7N2Q8wPDJ6lWOob2au+d0afJpKTPyJXktkxEp58WoNa3N6WBh
	/Smx0XHILJabQ0KB8j4cI9+d1DV+eRJ0LniRGPhMYGoyjfaeKX7K/3LeRPy0XbcKVaNg0LoAPXF
	a/hvPekwP3Dm4lpo3hWZavv+RQuMmi1lfnH0mJzRnIUirAI0y6W7YEOgv7PoS7QH+s3frEtWvW8
	JR0Uzj9d3jYrp+u9vbrKjj9yxqaXnRMZjHcRYXwQwl9c23a/PL+4sJLBwG8NM/fn+L2JbpVl3xT
	rBukcIVsEXlipqJPAdocIFkwsQlEfVuz3Y6A42OSAL7oK9EVPUtPkQg5lXIe5lL4ctBbjF2KVwf
	QssBfkjrR
X-Received: by 2002:a05:600c:1c1f:b0:4bb:6847:7943 with SMTP id 5b1f17b1804b1-4bb88814510mr66914745e9.26.1795172027028;
        Fri, 20 Nov 2026 02:53:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:3374:165a:45ca:24fb? ([2a01:e0a:106d:1080:3374:165a:45ca:24fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm74845985e9.5.2026.11.20.02.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 02:53:46 -0800 (PST)
Message-ID: <5ebd13a7-60e3-48a9-a11c-bb55e4d081b8@linaro.org>
Date: Fri, 20 Nov 2026 11:53:46 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] usb: typec: qcom-pmic-typec: detach the port on
 shutdown
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
 <20261120-topic-tcpm-qcom-fixes-v1-2-9a152f906fba@linaro.org>
 <sashiko-outbox-224916@kernel.org>
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
In-Reply-To: <sashiko-outbox-224916@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 11:15, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] usb: typec: qcom: NULL deref in qcom_pmic_typec_shutdown() when
>    VBUS is on
> - [Medium] usb: typec: qcom-pmic-typec: missing port_disable() in remove
>    and probe unwind
> --
> 
> commit 27e120f037d3faf6c51dac7774569601de458e75
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> usb: typec: qcom-pmic-typec: detach the port on shutdown
> 
> This commit adds a platform driver shutdown callback that stops the port
> and PD PHY, unregisters the TCPM port, and disables the Type-C block so
> that a connected partner sees a detach on reboot or power off.
> 
>> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
>> index 58d1e6aae637d..8169db478b8aa 100644
>> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
>> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
>> @@ -134,6 +134,16 @@ static void qcom_pmic_typec_remove(struct platform_device *pdev)
>>   	fwnode_handle_put(tcpm->tcpc.fwnode);
>>   }
>>   
>> +static void qcom_pmic_typec_shutdown(struct platform_device *pdev)
>> +{
>> +	struct pmic_typec *tcpm = platform_get_drvdata(pdev);
>> +
>> +	tcpm->pdphy_stop(tcpm);
>> +	tcpm->port_stop(tcpm);
>> +	tcpm_unregister_port(tcpm->tcpm_port);
> 
> [Severity: High]
> Can calling tcpm_unregister_port() here cause a NULL pointer dereference
> on port->wq when shutting down with an attached sink partner powered by
> VBUS?
> 
> tcpm_unregister_port() destroys port->wq and sets it to NULL before
> calling tcpm_reset_port() -> tcpm_init_vbus() ->
> qcom_pmic_typec_port_set_vbus().  When VBUS transitions from enabled to
> disabled, qcom_pmic_typec_port_set_vbus() calls tcpm_vbus_change(), which
> queues work onto port->wq:
> 
> drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c:qcom_pmic_typec_port_set_vbus() {
> 	...
> 	ret = qcom_pmic_typec_port_vbus_toggle(pmic_typec_port, on);
> 	if (ret)
> 		goto done;
> 
> 	pmic_typec_port->vbus_enabled = on;
> 	tcpm_vbus_change(tcpm->tcpm_port);
> 	...
> }
> 
> kthread_queue_work() then dereferences NULL in &worker->lock, crashing
> before tcpm->port_disable(tcpm) is reached.

What's the difference with qcom_pmic_typec_remove() ? So the same regression
occurs with qcom_pmic_typec_remove() and is not related with this change.

I'll try to fix it

> 
>> +	tcpm->port_disable(tcpm);
>> +}
> 
> [Severity: Medium]
> Should tcpm->port_disable(tcpm) also be called in qcom_pmic_typec_remove()
> and the port_unregister error path in qcom_pmic_typec_probe()?
> 
> Without it, unbinding the driver or failing probe after
> tcpm_register_port() leaves TYPEC_MODE_CFG_REG presenting Rp or Rd with no
> TCPM or PD PHY servicing the port, and a subsequent reboot or power off
> will not invoke qcom_pmic_typec_shutdown() on the unbound device.
> 

Ok so it should be extended by:
- check if not in TYPEC_DISABLE_CMD on probe, and force a detach is enabled before
- disable on remove and probe fail to have a coherent state
