Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426744;
	b=fDR4E1+7i3qova+0fs5VkMxXHhd5zbIew8zwLGTtm0516LQC3g01cZe8l8hng1RlZxPU
	 rkmt3LuOIsVzTgJSBWfGy59b/Uqb6KHk3rXQBldF0JuBF9SPQpVDMobZg3/q6VAVbARfG
	 YYm29TsVEqAPn4jHc6ZCf5WEA+/0ZgfE/Klxiwc368wA6J8S5ZvhgEJQmZf9u84605oA7
	 /6m2NOSCShMCOAuf/civp1QT4PZbRhEWcZgZ99xJHJLO32vAxyQiXyjnFMLtyzsr+bZfv
	 FtUZKTRGk81WrMR64i2NluuG/K2ezVHnSWM7gwyXgvlybEcd6yn62ORoUZlTNTQZkHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=m+p1znZjzopnvNRqk1tkPRf4Dco0mC826WvcYUflTYg=;
	b=f+HBRY/6X5ai8aeJLlPwh7L0kGGWB6T/ZF/4Y36bcx7zUq794BzBeN5P3q3p9AxywKIH
	 oCJidSCHfMGS9jncE9jgMwb2glOo/UzM8EcD9lpIufQ9r+NuZbzgIDeKrG7BzaCaYiy3M
	 QkJDDN0F8o71PEAAfg4+q3DoAkyG4JZg6ngMXSDK0NZG4xZQcolrQhTgIBqopruvf1EMT
	 Lz8Fx8XwPKYPNlb9zgoSI4srHZHg2XzXD6oeiu4zdk10Z+slb3mlWsVQoXnOw3S+drPwn
	 bbjpH/3JL3oJNDNgP2xuRjqjneM5YLANmeRrF6CWw329NXWSP7mxEsDp1ZuQYXQRn9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=nDHo9d8f;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B1606A321
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 09:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71B1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=nDHo9d8f
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so2314768f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 01:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795426742; x=1796031542; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+p1znZjzopnvNRqk1tkPRf4Dco0mC826WvcYUflTYg=;
        b=nDHo9d8fxoLyCF24+Y2WBYd0UA7PpMFXTIUFj5aeqtBPQCliATOMZQ12Jv9KziEh+W
         ye4Oe5GtYg4vObhgkgjyqq2OtTppqkAo63iAC7inA1FFivf6zzkrfhyqrHM4Tez6gNJ8
         7ZqyykHwLHBa7d0zkSginyrziwyi3+d8tNseABFzsuh4ibFjcSDK5f7wkuEe/STXY64x
         MhB4pXmyxy+siYgkQrDWgAKqwxCFbajSjXAaC+mBx8IfKHpqXkK5ZdGnR/GF8uL6ll2y
         fnlYmveNLC1mhwQCSYOtyniGqfwHYo3l4gQdOnbxyMVdxRkZzAps/y/lVEzFSILyt1JV
         e9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426742; x=1796031542;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m+p1znZjzopnvNRqk1tkPRf4Dco0mC826WvcYUflTYg=;
        b=PiW0vqeEfv18pqsfhoZBNBiHtmXZeE1amVm+YJRCd8mzeV6S4dqNFBVz8mR6fr1X14
         0JmMQpjV7q7A/+buE6/1apCh7zV8Vvnp5UKqqgOnmgeThpl6/WXaoh9Axb26I8hlvJht
         +ZDykrPA6tGOaOQnK6Cqi5mkn+SImQgZHh7u400f6vCDc7ypCDj7AZymJ1jbZeJhgQP/
         V7UJqezz856ytp35cB2I7jW6vMXv1q85VPPfsWP3PX8JanP0SAxSPoRvnVXgnRbeemVk
         WO19qxFzU0aqkwcI7PlXcUcL5zhWaFNMvYjdK7rBXD0gddiMvX0ywYEMYReB9MN66ibT
         lLHw==
X-Gm-Message-State: APuU4Z9jK/jMbBnnn/dPb+E7cGqHz0pws1u5DejEL0taQK+IyYCzft1U
	43zTTldYBqzUSjVcSWndYH8fvnLCa6zhLGu3xCgrAw40nMy0D5KGKUIX9hG64sOXpLcLULNKQ06
	dnm0rixmA/g==
X-Gm-Gg: AZFdTZffP5gHme1t+tKmThm6fE+uPl52KUIBf8Kt8oIRcPTOooGyji0ViE7kpd7Zq/H
	1j9sgliv2WH5vklXivwaq5wAFB6kcVclXixKtTSpmij/H+R0RIpFJY/959TXpsDJTwtbykwTgVK
	c+WOmBV7ZfrYCSRGxxDF1GWYOsR+2E1rTc1hzsffFmF/5yRjyoD++cQPkYz4V4e0d2kzBvLwWcV
	uC0Ya2lBZdbxvGD5GSHmguAwbobAx1JlsRVkbYFE55RVQJyqTZjJUtlYFmqO8Zbd+jNrG4ruxyI
	EqLF809M4w5hsZ7owQNfe6eoZeYlzbR2EHItK2BmLs5aiLj8Or3FRNaPO+eeEBIKNkYgGVPsiKj
	b0+8B9xewEImmEzgK9IVjySNMFkVbNwAuZDoeOS+ECII2SoPEotSmXYTRwQ6GT/ku7ldMd+1c2Y
	uRweQ7LZdFljYeQDPW8upbOVCZ+40FwEe7k6GsZD2R3v7ExyvmSV27e51+J/5KspmkdiswyURnE
	LejecaGOncSjiYi7q3Qc+37XK5/cAXyrggocIpFeRXx76R0sLYpE3oNRA3IWGtWvpSAgyvmgiUj
	VLFUYFyvePEiih0wMhAH4bP5ysPkrXaWu1tEUzeEal2qV+AAxN3cnQJwlL0=
X-Received: by 2002:a05:600c:1c11:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4bb8881c357mr254339295e9.26.1795426742186;
        Mon, 23 Nov 2026 01:39:02 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm366470335e9.8.2026.11.23.01.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:39:01 -0800 (PST)
Message-ID: <b744cc8b-d7c9-4969-aae2-3f282614ec1b@blackwall.org>
Date: Mon, 23 Nov 2026 11:39:01 +0200
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
Subject: Re: [PATCH bpf 1/2] bpf, net: validate assigned socket on receive
Content-Language: en-US, bg
To: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
References: <20261123084138.723275-1-razor@blackwall.org>
 <20261123084138.723275-2-razor@blackwall.org>
 <sashiko-outbox-228972@kernel.org>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <sashiko-outbox-228972@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 11:29, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] net: missing family check for non-fullsocks in
>    inet[6]_prefetched_sk_mismatch()
> - [High] net: missing v4-mapped check for AF_INET6 sockets in
>    inet[6]_prefetched_sk_mismatch()
> - [High] net: unvalidated syncookie request_sock left on skb->sk in
>    inet[6]_steal_sock()

Some of these are more valid mismatches that can happen, I will address them
in v2. The critical issue below is pre-existing and will be fixed separately.

[snip]



