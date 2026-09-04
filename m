Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69C443A80B
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518609; cv=pass; b=l+uBapNETC7ZHZozPmlIEBs1bmlhvTbxRMCBqIL8cJuJm+sowfi7uXiV9owjvlZPGuH/DFrbALTiHGgSKS8IKArkUR6iOD9OuMX//BQLZfHYuYS68oqgAKm1mDTTVPak+dyLMHkYYgEWaeSXlav3oX6QmShGqMFp7gGarOBHFmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518609; c=relaxed/simple;
	bh=PCYwr2gWfc4hWkCYVlTo0c7o6YHLBz9ipjTep95eWgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aG3f8Boa3VtHv63zMJxKCKoAHImY8LmjKte+BkjiETzoLRahNO65SO9ijIVJHjwKDdOynPbwkxWf+ZToyNIFTyLI3F8T4rj9/Hc5GHE5O3sKpexD8uQrYug0ysNG7A1dToHAIE/xCjl3L7Acpzsr+A7oDwydBdOVrX5P6waP/ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OySJTVem; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OySJTVem"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c96c92c0980so563446a12.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 03:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788518607; cv=none;
        d=google.com; s=arc-20260327;
        b=MkcSJhgtRcyWGq1oFNX0nG2DIlkI6DRRTz9VdHflwphSSOHCfsNibVbHSfXfaDIETR
         jgfS75U5WjpPe3gibzywPnh0dPQugblXNMV5dee8PfztrepNbnrePmXacRdykLZOdxIw
         Zhe9foBvmRa+bI4WwA7eraBFIR3PIA73F2wixb8dYkuOw9FToXIyDMxzTJHuzh8c4WM2
         piruPdq2ffLGz7W+BZYcgf+1rrWAaeeXTgjkf7jiptJJ28eiz3j5GG0qzEnSCBDKGu/D
         i7eaX3bXxfshEenuyS60YAsAE+dru3Srj6pzy1Novl+9tl7IykuapiPDmKOVzymJ17/f
         nZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PCYwr2gWfc4hWkCYVlTo0c7o6YHLBz9ipjTep95eWgQ=;
        fh=LcgpHvf8Q9R5NlBSSEW9eNy+WcF5IoW3LDiZImP2iwU=;
        b=cM4ImRZxgKs1lwXWuBR093KJqYpmIZ6KmsHROn52hPAZpp6mnNzIT8753OlMXqWA9i
         0T5Aaio8rkzVrBuhQpnKhMwQ+A9cl6pWhld8KdGivLAPeCkx+b2H6M6htOoHyBtJkoGt
         NtJmH29xOXWR6ShlJuSwi5O2bDqGIZTZC+ymYKlL9A+9dGiYLQNJ7XLxojSEo6NARIuC
         7p0Ai0biLcRR3IsO75CbwAiG4Yoe+rMIWFOiXYO3E6EBpNFw30q2GmTmxUlGenUEnhDw
         bioysn7kQzpYA1ZBJiX/Yebo3PfDwNhbZ0gPUweYL2DuMBQemZl8PENRbjCKofWOf8q7
         zZIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518607; x=1789123407; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCYwr2gWfc4hWkCYVlTo0c7o6YHLBz9ipjTep95eWgQ=;
        b=OySJTVemLB3l4k943i2VX2jMVYzD0nRgaii91BwUmui03U8BTX6I6PU/cjcrBztAnv
         nY9KKrn5l3z/DanvIK9jqNMWUOb25XGEJxYfO3cMqqQ+GOOZvgfHQ9vkOqAgVtNTyHg+
         lytf6BarrlnvTxyF9SS23c0gOmpawa47zSRsdX090nv2uhuDU+MWKpUKqMSY8fHaKgvg
         zq+5nEonV3gMn6MNUWAGiM/SDJO5eg2dtB4pASdklhYm8RlXKUJQbNdj4Ccqy9zAHMYk
         qSs9750pjs6hxzjM7GiUfb0HKwiIAiVhgLsE+bF/XSnYT1w9S5DttItrER0aV04pAKPH
         JI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518607; x=1789123407;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PCYwr2gWfc4hWkCYVlTo0c7o6YHLBz9ipjTep95eWgQ=;
        b=EyvgLwQ6l9Ijg5wLsBryclwQaw5tj/kaspnYDwE/U2f4EoVqH9bwKSLmSu9anEL+qc
         YbDTLF6R2z2G+PRuLftL7uKBalybtaVLbl8LSKbNfn6wtKazJjpBVBYRP5eX8Dbf0LrA
         W0YdZiQT7kFyHxE4F0dp9bTTFjGj+ni0WP475UmPx345NZ+6SHDcNsdhwob09aidIOEG
         MPJ7ExtQxUQZmurjMTCwugpK9nFjJkUXEyXJfIPtns9kKbj4ZJt2XGpRKS3DZunPMJYf
         EU5gq898f7SwSNYhXGLqFN9+V890UMmr0YTS3ok7HEiHsADruLDYpf5NVvBUUfhtRKdN
         p2BQ==
X-Gm-Message-State: AFuF++kdowClZA8FuWyl/bECMub26OYT4NtbD3b3/k+c+FEX+wVP0CkI
	UJBmh+Wf78hz6Ea6sDIQ8IcCn3vmF/yYBwSL2yVu9SttneB/vG1417f+EDbziURVs2fea6JmKXB
	WLqocDjR7SaPV2UhJP9vsQsZhsfL5X+zMmeGj
X-Gm-Gg: AYBFou00BvhytUalCnqS9EQRDPrRRmLWOQ+cOhQPE3VPImODAN/Y8HNKw4JZdVRAmbr
	UGmoq7I/nEM5W2OKscKZAxc89de6C91gjigMvHVp2S8gXhmT2a9UiH1KpWhsjU3h/hMZt+gO3CN
	n1wbghJV42MBkNu9UakodV8TNX2ij/KZ6NGMAUFtX86zRQFn82afYm+U9ZXn+EaNjZW2tFuKrYN
	0Ua6VMwZNB/RZ0viaO2ebNvJgCSmSZ0fzz7kmKmdEvXTGXNB5PnT0/cs2SA2edfqzzkh5+s+dex
	DlnZs9f9unguLrKAAXgN/+5Z30BUCF0BNM6D8QaCO4g/g2tUcol5BCjyAjJI0oM5b+5CoxcNeDo
	Gdpdyi6J+6uHXkWU8xlQF0gASg0/OOI8x6BeLqKZRHVkf1Vj8N3DYDX5N
X-Received: by 2002:a05:6300:2284:b0:3c2:dcdd:a85a with SMTP id
 adf61e73a8af0-3da39ffc3efmr7989426637.13.1788518606861; Fri, 04 Sep 2026
 03:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903092430.354186-1-phucduc.bui@gmail.com> <20260904092519.2644A1F00A3D@smtp.kernel.org>
In-Reply-To: <20260904092519.2644A1F00A3D@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 4 Sep 2026 17:43:15 +0700
X-Gm-Features: AcwNN1Vg58vqQL0AXMopCTNtBCRqKjwITxIHs6VBlLuWtJsCtUDT9b71c8c_Wiw
Message-ID: <CAABR9nEkci1OFoHx2qmJWvKabUN=JSu5AcPynQ-tH02wxHEmOA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: fec: Propagate PTP initialization errors
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> Pre-existing issues:
> - [High] The device interrupt handlers are exposed to a use-after-free window on probe error paths because devm_request_irq() is used alongside manual free_netdev().

This series fixes the error path when devm_request_irq() fails by
propagating the error to the probe function.
The reported race between the PPS interrupt handler and device
teardown is a pre-existing issue and is unrelated to
the error propagation changes in this series.
I would like to leave this issue out of the current series.

However, if we do want to address that race, I think a potential fix would be
switching from devm_request_irq() to manual request_irq() and
explicitly calling free_irq() during teardown before cleaning up the
associated resources.


> - [High] Use-after-free on perout_timer due to incorrect teardown ordering in fec_ptp_stop().
> --
>

This issue may already have been addressed by this patch:

https://lore.kernel.org/all/E1uydLH-000000061DM-2gcV@rmk-PC.armlinux.org.uk/
