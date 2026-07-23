Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DD537EFE7
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828751; cv=none; b=jz3Ij46niloMiM+xjw8eskJGxHLau7hfr+tIWyHrl7I0MHtE0aowDycwQ8ZHNCsTjCySiW1507zaTVXjxG+jpxIxV9PqmVYAIsCLmsIP5+KimuV7tjUtGpI2z7euJvfzueOHP6dJPysdRePk8cavUYgUnFhgK4jrdmRe0FT2lWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828751; c=relaxed/simple;
	bh=KZY5Per6gqC//uqwYOs8Lx6+Xn/30uRA+CAzdNfsmCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiYcDFO2X4Lbo1+iJoRC2oVq0q3Pt/f7TXDHvrV0XlsR6H3NtsvKkuEqfzvmtgS92/4gTibo6O37cpH+xYuVkBMJ0Y/TblBtcBvBbpGxpLXrei/smrrtGxd3i6FzVigCShBA1o5yWhR+aeZ/5neglWq4LtgwY4hFQh7vxE6gCC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3/cSYjV; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3/cSYjV"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbb662575d3so575083a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 10:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828747; x=1785433547; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2O4xFuAHBp+wc0jU7apiTfSbaN5z+iCv3LYdHU3FUCI=;
        b=L3/cSYjVive+BZfOPkAA/ZmY512d54p4fJ6N6S1tgrpIXI5Nespoc9iwDfRRubKq5J
         rbG0kPNc2E8ObxtfBU+iD+KFGhFMfxvKP+63U0HCZ0UFwY9Cy9r/bM0tTKj3ru5Y2JWL
         ZMdpLNqFtlp+MaLB7GnOqlPMn/WlCu49c7453gnyE0P9FvxRinUWkf9RqeLGqbFo8w81
         DoMJjLqyt+gfxhfByvnd1xGTt8wnG2z4dEodq2YHJLwDajHmEdAwK2yi9JNqF0H1fxgQ
         0IUz3JOWG0RPr1APrxyuGOmS1dW54KPDbs0dbkWEx/yfTQ1BJuokWjicbikt7K2LbU0t
         Sghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828747; x=1785433547;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2O4xFuAHBp+wc0jU7apiTfSbaN5z+iCv3LYdHU3FUCI=;
        b=gnILu/3Sr81EhlAYxFrRQuaKkoXZqtWyhUu9SEOejR/+xPZoBbVepsPBhtXaCyOpQP
         ojXuUK33D2t5GSJYuD0JpYpKvlsM3nFwVdgmTwsFUVyfo/Sq/w1vfgUYDWUNxAh53vRo
         WPLIUNBeCtVwS+ewCbmsBckzyfCLB9Wz3gzleamJI+2jFBtG4Qqb7lRclcrY3TMf3+AT
         ac1xQYvofAC+OW6/in08KTw0JKe5DIxoSDbdeBgVJ276/ScR80qySGbhF7X+XMLxT2Ey
         CEeCKcY4Yq+/RXQs8AJ3mNdAN4oEBKm9t3YQWg06pk/yL1Ml0TD5I3x3TtJ4/8K2CXVb
         yQog==
X-Gm-Message-State: AOJu0YymJf1EPrd6BiuUFe8ivQmHpC9e6zS7G+/pIygYXuoz8WydZSa2
	PHXViDuhslZdKP03c1xR8xkG5ZHlZY1fk3KpvgbdGnwOAj7RCHqllcR7qUespA==
X-Gm-Gg: AR+sD10S2RkKON/e1sOcTekC1a6d75DhLH56sjk0y8rkzDFRlKRPoeZ4zyZmhJ3ckM4
	b3pIUxWUp4ifSCd/qQOzUtlZepkBghBips/gKNqksOqUvjQaQhCUeMt+2wmU/KOeTvfZ5PrceEG
	IqQYBYRuLPCKECxL1pPkBM6Zep36MQhqi9ni3ODknTrfF48CtYIncf2LBro6WD7n7jnMdQMyCmd
	qOO4tdduXn2Du6DEFN3OOZLqn8qmgMLiVI/tFvdav6UDQX93YJBNfIQZx2qVzE4FnOp5gqwN3t2
	1BuAtMOwqMvIJfFcEm5VLslHnN51rlcbrnN+0e/v4fRB+xxJMt1zTnst45AzDyF5g/xE77MHd9J
	jsIvhfGNbGkZZbGVMTJuLWCzr9npH+fSaQVGEfKOb93RKg5JhvlqTfvdjCvlxC/cc2gShEzl5QS
	zzOwKEB3i0RsvDr7vs0cmX95LbxA5rPPtMOucd9c0YnQ==
X-Received: by 2002:a05:6a20:e292:b0:3c3:7fff:ba72 with SMTP id adf61e73a8af0-3c44b2b9706mr4676613637.70.1784828747494;
        Thu, 23 Jul 2026 10:45:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:f5d:dfe5:9bb9:71ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c7ff4sm23572393eec.27.2026.07.23.10.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:45:46 -0700 (PDT)
Date: Thu, 23 Jul 2026 10:45:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexandre Hamamdjian <azkali.limited@gmail.com>, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 1/4] Input: edt-ft5x06 - ignore contacts with an
 out-of-range slot id
Message-ID: <amJSt_g5We0R-eJo@google.com>
References: <20260723-b4-ft5426-v1-0-d4b4e32be042@gmail.com>
 <20260723-b4-ft5426-v1-1-d4b4e32be042@gmail.com>
 <20260723114100.D6D641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723114100.D6D641F000E9@smtp.kernel.org>

On Thu, Jul 23, 2026 at 11:40:59AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Unbalanced `disable_irq()` calls when suspending and resuming in factory mode lead to a permanently disabled touchscreen.

This is obviously not caused by your series but might be real, need to
check...

> - [High] Stack-allocated buffers are passed to `regmap_bulk_read()` and `i2c_transfer()`, which can cause memory corruption or panics if the underlying I2C host controller driver uses DMA.

Sashiko hallucinates here. I added I2C prompt to teach it that I2C is
generally safe wrt on-stack buffers, but I am not sure if it will trace
it to regmap.

Thanks.

-- 
Dmitry
