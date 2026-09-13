Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CBB36B925
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789291893; cv=none; b=fWq68BT0PAsPuaf3K/bglQ1NhU1vPS2IFoC7xAw48bl5Q9yUl46/upTsjMk71NqFDBrff5yKuRhqb3ajA7pa9ZcibFJ3t014/XScm4iyu/uSe9uzzG6KUY71LWcTanZpPsJn7wH6kKUriRCLpK1xtb9OyHQLX1ErfYTiUXro/88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789291893; c=relaxed/simple;
	bh=xB5jj8VPvBnGrXDhKdmlbyncIiPk1DJUxDep5ugNJCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FnzddWOoZD+jbIEb1WD6jKLqzWn4xSe/CYruNiClSfiAPz3fxANnw48KFPkY2nqHKWhDE9tjqLBYYdG2MmgWkuKXB+ikYv3rWIjX9hCSxC6Gfw2r5WU/CM25wt+fpARyy+gXH3ozcZXIFTWxHKtolxzBDu2LJfyNHoiYe4NQfIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8dP3KQA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8dP3KQA"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2db858d60e0so21036985ad.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 02:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789291891; x=1789896691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB5jj8VPvBnGrXDhKdmlbyncIiPk1DJUxDep5ugNJCo=;
        b=s8dP3KQAgC9ilYncUFXs2lD9r/lv29LgJNcfPRTPEp/Bu5K64QVcw6JWyXXLyHHrzd
         1wXzaTpeA+KeNXnHWGms8/a7QWoLPIVJESciepe+MkNDp7+qobrdc+1xnaS5uuf0M08k
         jeTX0N6pMdFXws5NVm6IM5qeW+uej7yQFKSNVyerInQ3bDImQmZDnYm9nIrfKhrU2iSS
         hURwDMFXjlHPE9cSppfuoD6KAO2AhfWt5UGjXppV67DqsmQ7FQ3M+jxCA/bOMCkNLgNa
         Lc1r5WC8UX2nk/5dKnVR+lWZlSQJrqUqZcXtMuMdOo3cPseDOyj8QU5LqbrxkBkDn+L0
         NqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789291891; x=1789896691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xB5jj8VPvBnGrXDhKdmlbyncIiPk1DJUxDep5ugNJCo=;
        b=TIxYVPb8UmZIl+w/bjLWAWnVydisFy8+zNGVHOIR9UvOOokMUS70A6IZt5qmXMP8S9
         iOoSpC/WAg4XF4N0FWl5sC7/YZoUetmf03eVDtJ5nIO+qt6/cnLRi0f0O9fibjprxCYa
         7eE0FGdculsngErUlE0HZbViN9Tksyai2ViTPy5XMb7pLwqxCKTBTAvLLAzvWA8o21kO
         XpcTA/thXaRwoqdlCF77sIf/yTEaiQ8JpYHeRrxPBTAmOaf33/bJlNdTaWLb/44EEt7E
         UHSWQ5WHrkNvNuRA7dmZR0Swijs068V40t4pelVDgCnMWtZSU9W6OjuEsrM+0GaU587A
         u4rw==
X-Gm-Message-State: AFuF++nMj5A3O54HORI7gkvYrF8yCi59tFlGWE+QaM8GSHj+YKm3kuiF
	ukmSGGnIcKlFlHfx8WV2ZBHEKkufI/AmyKxH+h0l/tRup+n+ZyF4PK6USM6TO+o=
X-Gm-Gg: AYBFou1BRu9Ch8rlcZD2RXIGicqUgBjHfW3nzuItGBDyJW58cnLfaBunf7pqTFT08xV
	MfOnuWF2ziMvt0+2VRRE+MX5IqEx89o0S1KqUIuuBNYK4E0PAsszVynBYdZITHdh7ThDMC+x6Ak
	LUfRNrHa57gDkzMmfRs/6juI6uU2wBIHWtE5bwB483fFXg970VCbeZGPHxp8X/qYLAfeQOfN4TU
	gwB//tSwV/fBMfwAc0P/xtVRKhflSwvanxwGuHmkzeaUlzOXBQbKwhfHTZj61tOU3tI0CBfG3VD
	zALO8Ktgope8jpJQl2XBUVav1tMaOEyEtQLM9zRn0OAHMTkGysm91tlpCGYM19KwBatHGfu5jQl
	CzqEvVlvs5bZrkYThunMzlTb7EsZAhtAARE6YzPWCfX9rUiu8AF1od0f9wwUwwQvo2izvlJn1WS
	AH7sfz30IK0e6Ya6IPFMljQ5FDzYGq9n+S+gCtnBPQM3lMssymSvus4MgAKDS2OCmKkTBOhcfB9
	KjsZZbT0COgmXje53eHoic6SA==
X-Received: by 2002:a17:902:db04:b0:2dd:3ddf:b87a with SMTP id d9443c01a7336-2dd3ddfbb26mr152670615ad.0.1789291890999;
        Sun, 13 Sep 2026 02:31:30 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:b91:ff81:c860:362e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff67aasm31954125ad.79.2026.09.13.02.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 02:31:30 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Adriano Cordova <adrianox@gmail.com>,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v3] blktrace: fix the field offsets of the synthesized v1 record
Date: Sun, 13 Sep 2026 18:31:24 +0900
Message-ID: <20260913093124.717495-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913091321.B3C061F000FF@smtp.kernel.org>
References: <20260913090232.715798-1-donggeunyoo.kernel@gmail.com> <20260913091321.B3C061F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 13 Sep 2026 09:13:21 +0000, sashiko-bot@kernel.org wrote:
> - [High] blk_trace_synthesize_old_trace unconditionally parses ring buffer
> entries as 64-byte blk_io_trace2 structures, resulting in an out-of-bounds
> read and info leak when processing 48-byte v1 entries because the required
> dependency patch is missing.

Correct, and as the patch says, Adriano Cordova's patch has to be applied
first.

The read side cannot know the layout: magic and sequence are the ftrace
trace_entry header and neither writer fills them, and the sizes overlap,
since a 48-byte v1 record carrying a 16-byte BLK_TA_REMAP PDU is also 64.
His patch fixes it on the write side, by not recording a v1 entry at all.
With that applied this patch is correct -- measured on a BLKTRACESETUP
trace with the blk tracer, reading a partition for that remap.
