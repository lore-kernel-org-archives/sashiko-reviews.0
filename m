Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795593571;
	b=cyGvkgoYSPWDEzB99Rjv0CJitD7E/f9BGM2WkaTnxsbJaj2ipNUyXtnq6CuSBglmlQ50
	 s+tW+6vjfo7aC5DmySZGr9tlVaOiJNFCv9s5ll8cmUCWfgrwmW97Es7KFZSi4iGjHqp9G
	 wk3az41sYlAwJz1P1/B/XbpoCvImlEjsLMhIqrgMTI+rFiZx12D+WMnXh21of5o48sb+8
	 PIguSOHAK2M4lvbnHMAvCbL3JDUUiSqjXpkY+fcuRD7Bf+euEV4Xt3PDOGETtTDhwke+J
	 UHg2rqKbrBUiQFbQ+YrRNoTP8o7SSFljmRwiUB/Q8cCBzOtH2wJmeRTZ+oUS52tGKlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Dzx8SjVAV6xQtssa++DVGlU6KxNu8vkqzBWqQg9Q6ZM=;
	b=n/0u5MmDkJCVT3ldJzboW5ZKjoY4TeiFOS+oxm/suvf7vmCkLDts9sVUZK1gKQ9IY+Vi
	 ec/r6Px585uwU4/rx9VNUgy06ni66adWIe1rwSkTOLeRg8T+dOSI2teAQj2kMFy7LX1rV
	 wLvFQcP9aoliXfUVxbhrIsGoynYYYHIDP/5lIASmlR9821HYG/zHaP/b+rh7gTNl5Rc0T
	 EHJJ5PqJXlU8PdxNNU2AgwLQILlYBIp7eyTZI7C8LHv5tNGBG05gLjUA031b9NBo2hivS
	 bod7fuYgon3C5pV5wMxzakfaLFEMgqt7wjP4aze9/XomgMEBLnuV+mDF12DXovYWHyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aE6sB/gL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDFE606A323
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 07:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BDFE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aE6sB/gL
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3863db981d4so7605276eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 23:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795593570; cv=none;
        d=google.com; s=arc-20260327;
        b=EZ77VZ1U9dONJevmIawoXnkk6dAa66RAtIlXeqSbOqXHLMyHjHSnGzLTSC0cIRVlvb
         NCBmSlfnNWiwkw72uOHh96BRXL6p8RVSt4e5ad4lZ6J1o5ZObe+hgJxvRPs3sOs2eruT
         5SxNVdDBZ0Z+DHnWzentqrd6qQwiWsT7rLUmanPh3BpgLSAmoJDOY1AZgFS2FjBzi7+c
         +fqf/TG+8fm4YDEz3GHyKrxtE2U53KOv/Acd1RSPrYluyy36ovW0nwNOqXyy+E+YeSfm
         uI/0KuXQTdX2LmY9WmnR97d+XyDqGmgOw06D7N32Qv7Q0a8/+/MnqiUp2KeNXPM+PtmX
         tCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Dzx8SjVAV6xQtssa++DVGlU6KxNu8vkqzBWqQg9Q6ZM=;
        fh=nYyuNW3kpVohc13kT0n0+GqTVBJFGb739VtfliG7Grg=;
        b=iCYB3qSDMqviP8066HiULHtJ+6cRPwRAf7LNYLmDXE9Y28+ZNq/OCdH8+C1xcepv4W
         SrZctHAQOyQH9dAsWoVwcmE5Lz94NrfxpC84ag2SQvCraesalE8zJRC65W98uzghzohD
         FW0g+J1mNsRqKzT0s2RfLpRsUVgCTPQmPSLqybT243IUFOgK3/2pKlqQ7SaYGtOZjYkp
         OIfU5395gja3eg4km3pPrAjCHLuPHNkIpJbBz2ABbNkjHvzl/W9zsywRwHePPlG4GtZH
         TZnfYPSgmnOE1IEJavlCWmMyOz4fzDujY+nG3Xnpf0UNIlQc+ynRfStisSgAprd5qzHQ
         ibDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593570; x=1796198370; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dzx8SjVAV6xQtssa++DVGlU6KxNu8vkqzBWqQg9Q6ZM=;
        b=aE6sB/gL9gx6k06L61FjNea1uhL2nUaAWh2H/3ReOG1B2vgF3FyOadNtZAvkNfJMzD
         UkQDLrB6Qd6kxYiQiVVuEUa9Sy07lf2txpmY6ocD8WtQMIEpnkjxsNNF0sdeaya2ml98
         I1jZPdKQyih63yfqAuXXzZAYzfNP1BmyvPt/sDAtuRsC6BmTl4+DsJNQpivqoguLMd5K
         gcNeqDZr0aP2tJ0OPc8yPBcLE3B3eSA48lnyMBO97IHVljAsRlsXUzNn+1Oqe7gZ3MG8
         oU6eDmPT+yW1Cq07cWbNOuyEr351OubtjRhncCC5Qm6qmve1VSodt6ZJYL4Im2+XB82X
         nX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593570; x=1796198370;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dzx8SjVAV6xQtssa++DVGlU6KxNu8vkqzBWqQg9Q6ZM=;
        b=b5BfDmtNvztcEubXSaVrErLov82tVKW8NGzOzieLI4ExUQ3GqR6Jrok1i59QmxXypi
         6Kkq4LhasHWIbFawp/8bKnwFuMaVPk0v+Wp5BdtphXd+xKMuBBEhnHD4lvo5W4iXH4YQ
         e3jwprW0rvH3wc0j4XRVsCIqfnbP/GJBHMiOzGBszDuS5dHJon2kfnTw68sWiCepqcPX
         CdA1LLKbC5kwLGAdPLYXTk14uhZP/lGL9jOwhrgTBgFn2lKpnY7ScrKscEB7iX3IX1sA
         cwviujOBUgQOZGMfawoyvJzoxnPq75LJaSX8zMuobxVcQ8pWTNSzhm4WXxT4yMjIZTK0
         w2cA==
X-Gm-Message-State: APuU4Z+PDqQlNq8SxouyQeTJfFbdQMjTlh/z/u3xKB9JRBuoK3GXUt7c
	sRbKLiz8QIQWhsaQj45m2layeWgrmKcN8gi13UpNLLM2FnwiA1Cbw0dXc+rxfVQW9Yl9VCo03NG
	2kUgvagZ8EEG+oCzm0IA3a9ENW3OMUPfCa01z6nI=
X-Gm-Gg: AZFdTZeIkip2L0ZtiBKz59MKDGk4mNQu2+PKHobu1mCw8A71/r9tKY5o6+OQQGJ0E6P
	84bPDfTPh6qsUX+IF66+OoyxoOcW7RePuEv0GpQCHvMXgYqQUvXewv+nK/8Gx6+TX8Iva/a/7md
	ZaV6/HzfDiEEMIqjjLXa8Zsgg8Ovkd/WIFPOpakEOBJ8xHMBmRJeN2SWGkmsZg7xx3X6XlkwGiU
	TYKIWlTLYNeBMRpJ/JkFybl69Tdswjkd9Ssc+p09cygJ8/H5t6KduznhUK7/ieThkokb+lSUFP/
	2Z4TnH7T6jmLl0xXdV90XBauspUwtHQm4MTdQe9nqtMT0AGh1T13yqPe5u/ScCYkwHvSyz8T77T
	7I2Lv31cQsHSmYCtgIAZlFUqmpAhbuqIlflxSFbs=
X-Received: by 2002:a05:7301:da86:b0:386:d481:8160 with SMTP id
 5a478bee46e88-386d48183aemr292617eec.37.1795593570201; Tue, 24 Nov 2026
 23:59:30 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp> <sashiko-outbox-232811@kernel.org>
In-Reply-To: <sashiko-outbox-232811@kernel.org>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Wed, 25 Nov 2026 16:58:53 +0900
X-Gm-Features: Aa3M54qXYVyCwSQzA9Cg1aIbfxm3d6Em-tWd2Uyr-wX7BgbaSHQpmZUFH4khkzE
Message-ID: <CAG7eodFbGRuig7rq+_VforW963vkc-0JFcNdO3s6M5ZOBV+wOQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] rtc: clear the wake IRQ on unbind
To: sashiko-reviews@lists.linux.dev
Cc: linux-rtc@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Sashiko is right about pcf8523 and rv8803: the I2C core already clears
the wake IRQ and the wakeup source in i2c_device_remove(), so patches
10 and 12 fix nothing. Please drop them.

For pcf85063 (11/12) only the SPI-attached RV8063 is affected, since
spi_remove() does not clear them. I'll fix the message and the Fixes
tag to a3c7f7e16ea8 ("rtc: pcf85063: add support for RV8063").

I'll send a v2 in a few days unless there are more comments.

Thanks & Regards,
Prasanth
