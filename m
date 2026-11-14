Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794673850;
	b=P7eM7sS/BsMsvWAvpyQ74yUWlhZ0CahvL8tV4zMcM/rgT35wo2qpJc6A7SuXGupUOUwd
	 ePeMLctYsWZJuqWfgiDGA+6idM2c5P6vMPDIJwgJDAbwNfbdVn4DTZKzQG7awFzGX1Wqu
	 dPobIZbdhaZ0GluZTxzTTgn2eOjtBgsMTzNOBwDh91gth7ac/R9kF3z/XXWc1oV1xBJyh
	 72BfZ6Icby/LGgfRZeSk5UcM2VfCsXbf7VbVV1mCG/VIOFUP2Newam0MJVQyXVW3wdcI4
	 tg1kdfYzGt+p67ILVF81kHJ25t+2DwFuvr1hSZLrl3DcquqaeVPQ06t80f1zuw6gPSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=fGWxKs0ygx50ezpgbkqjOUBZBQlCGRAkgSt+Tpagf3c=;
	b=DVT+74Ogs0j0SZPSHnvF5Kcm6Z6GzivlG8wrfOa1fZ4Av+bH3mpsvShj/keltkLVMJUb
	 HW/qfJE5A+sRNntI3lRMM7uTTLxSfBFFRKhsjXspRQA0e6ucx14l0ZetYsip5hBAvoYGD
	 8q322++rQ2gtw3LsspdaobQUHSnQmJobvvNczwTBfV+XBocMIN0p32+plU4cB/dD+vlTP
	 zwvl31W2O5/qg+KHNfkdE1GNDNsrs+hOWxClfzeKYHTmgdrTHHJhJ78wNRmNbdSI2pWBc
	 i0HKtbZaEMnv6jyHz52+Jk7fGP9VqoX7CXBrqRGMsEY/yJNBpD1Z8BWVvrcEcAsS55Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uber.com;
	spf=fail smtp.mailfrom=uber.com;
	dkim=pass header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b="Qh68/djE";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD02606A327
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 16:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD02606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=uber.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=uber.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uber.com header.i=@uber.com header.a=rsa-sha256 header.s=google header.b=Qh68/djE
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b2d14968c9so23032927b3.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 08:30:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794673848; cv=none;
        d=google.com; s=arc-20260327;
        b=Zi5ea+d2MbTqIdZ85wvmjQlKwvtxFLI/SwYXJS3uXB71P391vKRNuWnxbT6B2yQ+oC
         icelPp1E77MavWyU8YuTqrEHYlCXnmHGZNyAK7cvDQKsMTQZhxwi/tQ8tPulA3mkRO29
         GLzUzQBuyltXohotavHJnwy792AzDP+IT8Kt/X+AFFwmFbJq5lYGqhuksi/Bb8ZTpDr7
         dCyR31mcxHnbg59PgMrzs8lLBzrhpQOPZdqLoclLUexStaRq7fqQUJ3X2mpJMk71+/zW
         1sygpS9ykrPlNUarh74shKBq0/o1+yaoZE+HsDFE9Fssfqo9aoT1w0iNmXufYiYFHrPJ
         GqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fGWxKs0ygx50ezpgbkqjOUBZBQlCGRAkgSt+Tpagf3c=;
        fh=0zVHGC//SC94CWFKHtFt4lnskmkXkJNNy7lE0FDd3Ck=;
        b=mw9iVAm1U9znnA1MWJDgIXstxBxXSRF1iv49+ErV2b2sd+2Rs//2mnfRfukS7YvsQC
         gcyAkuM447X19TVtZggTLk/aEE5N7QwoCuxWYZLZoXaVJSiGbn69XkagoLPKEL7jB5Pk
         yOXT0FSGQDgGHllETp5OJ1HyHAMsl20plQsf3Zkq+geUs5K/pgmVYKOLB9R+gWBmvcCc
         EWBoQ84llzZohQ61vaJ6kBJuJKjvptfdddiMdvEyT/zv6BkkcCJTJL+Q5TFv5JUqBCpt
         KKo8hqOVhzEcywERQKynp9dDadeium51+mvfIwWEl19u4hB2kxSBYev3JNQIsplGnx+u
         TT5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uber.com; s=google; t=1794673848; x=1795278648; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGWxKs0ygx50ezpgbkqjOUBZBQlCGRAkgSt+Tpagf3c=;
        b=Qh68/djE8RG9jGi2wHmFLTHxEIyFw4KNzpRQHrA9Qf0FPDrbbQAnePOreHrqZMXhxS
         c1/9ccfGBDQvDUft6D+TL2pBV4ot6//4X11lsIHJNr0CUjmtL/16ptUKdUWouDIuRYWv
         uQ/Sg32PxtlUZ1KW0U8nZWCwpzGjPGbolaiu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673848; x=1795278648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fGWxKs0ygx50ezpgbkqjOUBZBQlCGRAkgSt+Tpagf3c=;
        b=LED849+AmTGoS78E8uoCbW/bK15mrs54asb0TD+feDxLwuS7g2bNvRYP9uC89zsv9W
         /nMc2nq4kLm4tHnHNWlw2B62CCl8OJqakMhLLcCCZHgZCU/q9iNiNCwIxjf4UEfasKp8
         duxcuqCAkTvd7wsNCNvxaq7Ezm9O5Hpe/FWu6ZrTvsgQM3P+/wazMQl6UEUDwJ1poixJ
         lCEk9HeTgPXUVoxVNUKiec0L/Kt0vQtcKdAuG6u9JTM3yD4wtU2t/gz7Nac9AFEm50T0
         JrX87BaWJK6PQ0rsFj535mt0JhXT0BiIb+lsCCENgKjhCbQHqKO9xhfFiMs24mH4SIi+
         O4AQ==
X-Gm-Message-State: APuU4Z8ydL0E8XNJth6uYpdHewZOH6hG4ZQRmrauhaDIHGwJNmcUc0yr
	3KjLX2tpHyovramIh9PL/iZEbvBQfk6e1+U/QYf8VWJDdmCOZn4s5O/3W+Mmwxnh2dQZ3kIoPQ/
	jdW+jjyuieJpvttDbHWGDF2BYWvbNMEhZsBweAcVH+ScSVCwoYacNTh7RisdY
X-Gm-Gg: AYBFou31ZvAX6wpEA/hNvB12QcDZ4une6XSSU+4bjR7kXty5UtYfjTnYXOyd3XJlxgL
	tuZlSJ3a49NkCm3KEcuzGb4eSUfHxRtZjq/ulHujyqxR42Vj4YI/MoSjo/jWC8aoz4/IyeOq8kG
	wQcTcQKPmqv599erN0hDB0pKyQKByMIQQVnG7eijzB4/8dXZ7CugZ9fcUU9jvOR46p6cBz3++T6
	cTmvfWNPRGWIny9n8bjX2I+LE31JrK31nEul1+i3CN356bCDTmXxhiI2BXT6xBiFYyxH7TuBIpK
	akyU+f7760QaRjZjtPu8hlfDjr5GJQ4wqJBhqCbcdOrISSHijIuY2ggX3hwaXZmZlY69V5iV8VH
	tCGEtVW00EWCGzXmQpx1WH96WvbAMds28Ge6mqDk+MSmkU3cBuVdOvzjnV7FBCBRXDU3cSw==
X-Received: by 2002:a05:690c:f03:b0:8b1:8aba:afe5 with SMTP id
 00721157ae682-8b4aa2eb937mr32268107b3.28.1794673848298; Sat, 14 Nov 2026
 08:30:48 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113-perf-symbol-memory-send-v7-0-d992eced9f9c@uber.com>
 <20261113-perf-symbol-memory-send-v7-3-d992eced9f9c@uber.com> <sashiko-outbox-214179@kernel.org>
In-Reply-To: <sashiko-outbox-214179@kernel.org>
From: Alireza Haghdoost <haghdoost@uber.com>
Date: Sat, 14 Nov 2026 08:30:32 -0800
X-Gm-Features: AclHuK982XcYJYA8AaQABqiKfcQLmXN3r5fAt__j6RIZF2emENSLWSuiIVJOgKw
Message-ID: <CA+w=M=ToJ-WYOZc4GhOPNDF3cbu-bPuCqhbMqvQMZL+pdOmuTg@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] perf script: Add --lazy-load-symbols to load
 symbol names lazily
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Low]
> Can skipping the .dynsym copy here change how symbols__fixup_end() and
> symbols__fixup_duplicate() resolve symbols when .symtab also has a
> zero-size symbol at the same address?

This is valid and I reproduced it with a small binary whose .symtab
has a sized function followed by a zero-size STT_FUNC label at the same
address, with the function exported in .dynsym. In this repro eager resolves the
address to the function, lazy resolved it to the label. It needs that
exact layout
and symbol order, so I expect it to be rare; it does not occur in perf
itself or in a profile with about 1M symbols.

I can fix this in v8, add a loginc in lazy_dynsym_copy() to skip the copy only
when the last symbol already at that address has a non-zero size,
so the lazy tree gets the same fixup as the eager one.

Thanks,
Alireza
