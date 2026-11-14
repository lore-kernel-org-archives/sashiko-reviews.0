Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794698049;
	b=Z3S2OSzVnonbII37UNHNdRBETGif5KD5XiSrPTOs4N1poCIDzSAnLGPjCcCcmlrJNWB+
	 OBdPbtgca2Q8M53pulRyEdFkqO4j5/CG0AVMD+YR7R/67xLPuE15bIcU7e4hZtmz4WJrK
	 vD56VJNzoMMFakc1YJyywyTYKctc+YJw5edYOJq2GdqyYY7WHoolaPtw2j6sLNdX+pgK2
	 gX3OM6g6INvKoUWw+Znqv8b5eU0BUAQbXbTuTNHxYPvpJf8p6a++TGWbPXZK0/M47WJA5
	 7PnbrDUxTjvQtB2i+ewU8/OHQTVlunvVDQrwevUUPnPnjDOh206TTX+yk+YK4aU3YFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794698049;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=MF8lUYm3b4Q7LDh+eTQABq+39MWDYCMYzIn/uwCA2lc=;
	b=B7hSoc937QlLAhtxrHWRElAeTJiXgMkPT8I5ITYu+GqwNhcteC6wN1P4zkBR5KRtkjpa
	 jlTsEUVv91UoS0w1gkFTZ6tBqQELiFuCu5ddTtMHmn0Pgd+2ALqcqGVG2X5ZymElrQCLW
	 luzLRTHGloVV/bKRrxkZzpmXxkCxVpJD5dcULCIcHjJexjdTkOqGIY7hHQJvi5ja0Pqfk
	 Co9o0OWBCbEGI9T4yXtnxRioM1ZSlMvbFiNZ29b8PNxIzckriwn7UI4o77p5rKeY9fd97
	 fQczbw2y84tENVa0RvNFcJO12LxAYPKpiQ5ScOBAxIL36XmdXcQ/5ZA5D17MP7aKkkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=CbHDKu1L;
	arc=none smtp.remote-ip=91.218.175.224
Received: from mta0.migadu.com (out-224.mta0.migadu.com [91.218.175.224])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC05E606A327
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 23:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC05E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=CbHDKu1L
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=A05dQw/tOo/0VMOJJqmL5AQ8CgUPaaQgI50m9o9OW7E=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794698045; v=1; x=1795302845;
 b=CbHDKu1L/KW3VroY3wveFLiEjAAbYKLRcc9bxUaSUmYOAV9/s7F9PEy0Qf0HME4gwZjyeLUp
 6ZUlz6HQI/3g7iqTmw+OqDGVYHO5oIdPNhdIXhtynauMg6N8N11fanEx96YZv7gm4i9mWlPSaMl
 yICjm3hVwrIhGi9QKCe/ObFZ9pmoQkZrFOvlvEiKQQFkl5mmHS63hnka3RBJU9gzK24nFyIjHSd
 q5rltCpseDAzCo/O+gXjSbDMcHEsgZ1UsSV2OPdxnYHjY7boR7XoVPgHem5s5Lq0qyY8FccKWiB
 ARbMhAspQ8uIXJFcITgkKSfyQ+jWz0QrwJaX9S9CBqZXA==
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id f9d31ba648e08677;
	Sat, 14 Nov 2026 23:14:05 +0000
X-Mizu-Trace-ID: f9d31ba648e08677
X-Migadu-Flow: FLOW_OUT
Message-ID: <2943a816-cc56-417c-b7fd-b45d0dd11ddf@postmarketos.org>
Date: Sat, 14 Nov 2026 16:13:58 -0700
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
Subject: Re: [PATCH v7 3/4] drivers: leds: aw2013: Leverage C99 for-loops
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, lee@kernel.org
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
 <20261114-aw2013-aw20xx-rename-v7-3-ea5a3113a479@postmarketos.org>
 <sashiko-outbox-215079@kernel.org>
Content-Language: en-US
From: Paul Sajna <sajattack@postmarketos.org>
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <sashiko-outbox-215079@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-14 4:00 p.m., sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] leds: aw2013: commit subject uses drivers: leds: prefix instead
>    of leds:
> --
> 
> commit dd420770c3e97b4e4988e32c3e735789959ed94e
> Author: Paul Sajna <sajattack@postmarketos.org>
> 
> drivers: leds: aw2013: Leverage C99 for-loops
> 
> This commit moves loop counter declarations into the for-loop headers in
> aw2013_chip_init() and aw2013_chip_in_use().
> 
>> drivers: leds: aw2013: Leverage C99 for-loops
> 
> [Severity: Low]
> This isn't a bug, but LED subsystem commit subjects use the "leds:
> <driver>: <Capitalized description>" format, so this should use the
> "leds: aw2013:" prefix instead of "drivers: leds: aw2013:".
> 

Acknowledged, must've wrote this commit msg on autopilot. I'll fix in v8 
but wait and see if there are any more pressing concerns before re-send.

---
Hal: They're going for the kernel!
Margo: Colonel Who?
