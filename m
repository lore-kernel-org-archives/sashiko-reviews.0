Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607DE3AFCF0
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 17:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791479871; cv=none; b=o9FKcwPh0AGkJZtpj38l3vJrKOyWwP88S/tAJDLrUH3PPeSylJT5QreTb3LlyokYvD9GAuUucMIv2XpjNlykmeBu9dKCNg8z5LJHZo8WzAkpuJlZtvRnjLeIZmbSxE+wFpO6bJgRjbtiX7fLAlXVwSJ8Q6K45X8enO+1QIyyEh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791479871; c=relaxed/simple;
	bh=18ppHiNkWdrfkvUG18hcUeZYoOypIbeiVdUwByTYuvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkQV2R4GxOnohpnqkpQJx1TlHxFfRRRK9Mcy7boLBLl+0e0uZsYmlYevfW5gApCpkZ/OPM4DY0NK1Do2quI8RVDGiQSzuCwbagRudUIDt0XUh6d0s0WVZrpzEqns/YoYR41gLa+d5NN/Qsdw33oLkMCixuj/fCT2jxs3vcBAIa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDGRFCOb; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDGRFCOb"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a75f960be4so24423461fa.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 08 Oct 2026 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791479868; x=1792084668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGNnZ3lh/82Ool9Pw0Js9vegW0LbnM2AKPqkWKOhgzw=;
        b=GDGRFCObPhbzi/LtRmAki9huKfLnhTUSStNa8IHGLB2BbRsi+jAEEsPvss/B8DJAHw
         VoJ+6LuZyk8rxHdf3qgJiatpexp78a9z4v4+fh+1/0gxHV0TKIFDwyHbCKMX8HeqljWj
         hU8v8kxCUpxAzRW4DToFl6dxWTy3HHj5GaaYTR2Zyi9VCMxlm+qebXJcnmb2KmoRXsgU
         //fCGdlOdkgiED3uuAqPEFilaFwcQYUJWpFUCLym0bZtc/CQx5gqbixWi1pVGcah8kd9
         l0RROoMkv/KmJQtpa1iblYIn4grHAgeYCL/qeobNqiTz/XsAGo3Zs5NOEIUBXaZD9pHk
         uNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791479868; x=1792084668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mGNnZ3lh/82Ool9Pw0Js9vegW0LbnM2AKPqkWKOhgzw=;
        b=jSCMRMAgwo9AMiQEf8RCfj6xJQOCzZaGaOFdLvnYuHcQSRMlfAXv+GOONzCmmvXLjN
         eqY4bzcZFz2gDCgRXlx1RqxAAP+s5woIV++K7hrlPdh80Vci6LK6eQJaQ/Y/6l/1oTfq
         PIse9yAEZHJK79zoSOpxgk8bodvftBv3tAHQBnOnpnzGzTRLP7uS5Voe8SGmPp6DNlCP
         gThqEYIGA5L24ponjVXSrPP9+ziV6S17HLyS5uOvWwRKSdUy+/tFXjdwil++mQIqOuWm
         x/hlcDaqguGX2tkjYGJBVvvWbP+d6yHZBcHt5dzCQNNwFQm3ixBep2kpAho9KEEch9gV
         mBbw==
X-Gm-Message-State: AFq9FYJmfwikrRxB7ULG2MoIdGen3Wv/jhvqWxP4RisJllMegMPkABsJ
	n/I3UConK7F9mzIpxl/MAw9uA0lM4Bcia3ffWLRSMzVGudpnzL7XHstUce1F0Z8lM1g=
X-Gm-Gg: AYBFou1kbFNezJWOMoZvBbTDBKFhwxpiJv0wQkwSuqYKDCqKD5FjMaa6m2XyCtJnfH1
	+dowe8pEdelBHMfbzTYfZwSa+N05xuLHCXKJBpDgMM2msGwHYIxnrqFXpCDbUh7x+p7bqf5LLUT
	CK4q4afubaHe98yXKdT4O2S26zd6XeKmOeaoxmF0lheWrwqf/gLJ8dFdRT2qNBwCLEyLsrGbcd1
	AqsORG3ZiPFviaq/6qHQ64QDCvLUo+J3ZAkVxqtD/bYaqq4t9E7sH6NPV4PnEpmqbn5zUbimszn
	pO6HcwehAG+H9ek7rDlg64291qslfQgaQ6AATn1eLG1oRx/qVbIC6LWA8hggIZuDtE3WYTsWAyU
	+a2tiexXXhW7WWy8y2dfZYsVaiKS4T5Yvpu6j+8jMjDZouVqo1awUmEn2Yjt8VfMoftc+8tNPD5
	a4GpCvEsOzHDwKlcILL7SnY7jB2OfS8S8IVhoC633Fqj9QGjSBrWR6h9KRFDjZECUNmYM/r/pFo
	XWkhKXjFIb1GWhQPQNdoGpS7UsPVFcYROwECC5eAnlm/ToFoCC8
X-Received: by 2002:a05:651c:2106:b0:3a6:47b8:c8a4 with SMTP id 38308e7fff4ca-3a9a2d6a739mr15029421fa.29.1791479868310;
        Thu, 08 Oct 2026 10:17:48 -0700 (PDT)
Received: from localhost.localdomain (95-24-167-79.broadband.corbina.ru. [95.24.167.79])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c13e6530sm1193631fa.9.2026.10.08.10.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:17:47 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Maxim Skokov <skokovmaksimevg@gmail.com>,
	bpf@vger.kernel.org
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Cover test_run csum validation after bpf_skb_change_tail()
Date: Thu,  8 Oct 2026 20:17:37 +0300
Message-ID: <20261008171740.47837-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-163281@kernel.org>
References: <sashiko-outbox-163281@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 07, 2026 at 06:18 PM +0000, sashiko-bot@kernel.org wrote:
>> +	/* Drops CHECKSUM_COMPLETE. skb->csum still covers the trimmed bytes,
>> +	 * which hold the non-zero tcp.urg_ptr of pkt_v4, so it no longer
>> +	 * matches the packet.
>> +	 */
>
> This isn't a bug, but does this multi-line comment follow the preferred BPF
> subsystem style? The global guidelines mandate that multi-line comments in BPF
> files should have the opening '/*' on its own line, with the comment text
> starting on the next line.

Right, will move the opening /* to its own line in v2, for both comments
here and for the one in patch 1.
