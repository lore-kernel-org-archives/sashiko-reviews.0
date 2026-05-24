Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39253955CF
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779630066; cv=none; b=gEZGkZhyi/894QcuW60HFUrzRUJV/P0LaxfD7QMVezi/vOrJNdE4pq5boxHXC4tWJawWpQ+jLPKrQFEz9mZkZfRYKitqg2CFMyYBCh2+6am06SstC1puC3SFghocXputnrdwBF+3wraOXzhe4Kwipf2DrUztmuacPRkzNWIHM2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779630066; c=relaxed/simple;
	bh=YE2D6Yx62HegRB7eePV6cqqeBT2hshb8Xv6lGQTskJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuTn6Y1QjJ7Al27P3jwCSXXx03MGWnWC0ufmJVWSYdPZ74t+9CHYsaSJiVN8myNkbz8gYhW5QxwcftUI0/RH/uly2XySyvK7eRlQaVP7Aqsg9Yqc3zB1xcJTbjFW8dkJQJntxBJoPP38xRRHnnLkU9LNYyyTC+BVEWpqwlq4vQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFNEclvU; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFNEclvU"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-136b46c3540so582326c88.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779630064; x=1780234864; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tM8HwzBz3kh3Ztc0WAojlw6GmamMdNrpGEIg2fiOLS4=;
        b=XFNEclvUlBI0bIcB3fM/jw7giRKRwO8oty6OSvNyhZ5Ts0SkELYrAKFgd7+T1LYZzC
         DH9ygDyp7pLURVAucmL2zc9n/qmJzLdDQX6Yq9q5oz0t+jVtUzES6JxCcF1/kom0N6WO
         QOYIRMjZ4U8fRvp0jnOmfdTvEfHq0OFtDW5u7bpzXfbnLVql7Yaf7lgzOAAYH9sOhd12
         Xy5dpeJWo/A4LlQPhnCiwOLSOcJy1J0QCyZR7fhTFjDVnMsg51llgZgs2MdADBWGp5bN
         P0wqf3x1m9wRZ62B27BbVbh/Khr5qMM+jo6HZJP35kmcoDrHLGr4yCCxctaVMDhBuwsb
         0ntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779630064; x=1780234864;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tM8HwzBz3kh3Ztc0WAojlw6GmamMdNrpGEIg2fiOLS4=;
        b=WXDaOXOuOpILdJk0X27HXdHS0zSFh/kRKAywP6dFIHtqVUt2ujVSMeR03mQZW7EYP6
         ZPPBRVAxz5OI4IPFDmb+tSch8l8lZ+nEPcGnjkq5rUHqt71xzZ0eauOkL1BLI2Ef6XDy
         AnKedIBrdHMWJ9lOcN/sg6M4g6Zk1aQP5R5lRIg4h9XWpmAQJ7UO1BSQ8FeU8athpEP8
         uh1YeF7gLJnGuoyDfvCq616Zru2LWIFuPia9ZrK+1r1HbogWxr+0JdJwnW5aTUEht3Zp
         i3To5cQarUzrDe2wFXoHPAy0VkUTqCj4AQbU9KCxOZe3rfUDup4vWjdxudvsIPV1jPZt
         UWzw==
X-Forwarded-Encrypted: i=1; AFNElJ9apMzLlfcWSKgH+N03b+iFilaOwVz5m4OZTmzU0RQNhRc4Nuf1EZK81HWb49Bf8OcYyRw+6NfrQzw2lE1EfUo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4/q0zMNNYaUGoeJ9CK/XpTcjjYS+36qG27tWbMzLE8QyJTQD/
	cJz+kXRVJSI4AjaSmVcN1OENl/waduuUv19Co527PNK1AE7oGRPKiEYl
X-Gm-Gg: Acq92OHsrM6C+oSXSKNDM5RXdSuTN4kmx/l5kttiGeEu0T3RwhNZRN0nda1KkA62ljF
	S6cs9Y6f9gmgkV9JtYss+P63VbdL1MiFTbzzRA9iIH7rAIT/lKvMfvdJ6syqyVtaIGRwNGJpcNS
	5IYv92ciLk41t10bFw7b4TATPs8kYpuBbc+puvA0/nf18X9dhh7/HwGvPJBE3kNPWvjuKo7VFPn
	KWe+lSfLROGNceKttaw44EnRHA4RFl83+fv777DtlXd9r1Obg6QcModgWXUyA4KRjYEYeAOUttn
	vJGUw1xFLARpuXv3wd9eYt7kda21OTjmym5t0s0rImY6jKEN1rpnBg3uxPOl4y9EteV25RGy8Kc
	VRBbjrVJgkt1/wBiCRmgtaTQozwnjXfiUgCXcEE54xtx5cu0p659Q7jnu6fTIbBQO+jhdZK97oW
	jfzKzhu6dXb1lRTt7YNAwdRsK58t+umSv2RjhNVMiJVlXyp9S7L3m2QzWBFgvS8cGk/o7qlc8i
X-Received: by 2002:a05:7022:2528:b0:135:a6a:fcb9 with SMTP id a92af1059eb24-1365fb5a001mr3618351c88.28.1779630063581;
        Sun, 24 May 2026 06:41:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366a4011d9sm4570047c88.6.2026.05.24.06.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 06:41:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b3e2188c-064f-4c43-bb9c-cfabd8be1380@roeck-us.net>
Date: Sun, 24 May 2026 06:41:01 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 1/2] watchdog: ath79_wdt: select OF and COMPILE_TEST
To: Rosen Penev <rosenp@gmail.com>, sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org
References: <20260524015042.175271-2-rosenp@gmail.com>
 <20260524021121.7236F1F000E9@smtp.kernel.org>
 <CAKxU2N_jsxv0Zre0FJUGFc=YRyB3Ww8bWxvgwYp0RFaM+Hn3mg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAKxU2N_jsxv0Zre0FJUGFc=YRyB3Ww8bWxvgwYp0RFaM+Hn3mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/23/26 19:19, Rosen Penev wrote:
> On Sat, May 23, 2026 at 7:11 PM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>>
>> Pre-existing issues:
>> - [High] The global pointer `wdt_base` is assigned during probe but is never cleared on error paths or during driver removal, breaking deferred probing and driver rebinding.
>> - [High] The driver fails to prevent concurrent access from open miscdevice file descriptors after the device is unbound, leading to a use-after-free or page fault.
>> - [High] The watchdog hardware is not disabled during driver removal before its clock is disabled, potentially leading to uncontrolled system resets or hardware locks.
> I am getting fed up with this garbage.

I appear to be missing something. Which one of the three reported issues
is garbage ?

If you are really concerned about garbage, I would suggest to
- Only submit patches which fix real issues.
- Do not submit minor patch fixes for a driver to fix one minor issue
   while leaving all the major problems in place, even though they are
   known.
- If the AI feedback really produces false positives, help doing something
   about it instead of declaring it all garbage because some of its findings
   are wrong. After all, you don't declare a human review as garbage because
   it also contains false positives, or because it doesn't find all problems
   in the code, or do you ?

I am not going to apply this patch. It has little if any value and does not
fix major problems in the code.

Guenter

