Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207328;
	b=QMkCE/l9DVwUZFJuRTw+E7bIAKgeDgT3eFpcHZ/jZmKMKReR6MIPPPUrjvDN4U0cI1Ke
	 LdZJXq6v9b6a1RT1jeMs/dlu7sVuhbxxY3Uh0rO3u6Rk5yMhcXVGrKyQo2CYq0bmanegE
	 mXfh+rJJwphi69GvqEbfOGqjqrvCJ13DdCaSlK0G8o9Dr823TZtgdxKr6msnFYtUM4gvC
	 s4FWbgBq4Bgbtm4lwkZL3ouvI9fJTvOhKBZ1e5hz2LCR/pye3/2Ej1uhCdocWHNWyhHpo
	 jfvyy956f5s47FYlmAxya/mAd4qCsGN1ba5M0iwTAvYuV+QHGPu/3I/9n5sew9etfbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207328;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=KrVV3AOCGOoPGe2MUIFLejrxfFKgPLjyVQ0ZWShESYk=;
	b=f5XF7FZGcyzmCuvmwreRsBfbVxdC0gUY+54yODACTKX+2FEnMJ3Zr7Ic0nSeOfpv4mL7
	 07/PfkzN7WrDX1dk7q2PHYzhMHEamHOwz0C3BwnyTpCNLcIhnqoeIT7lYlzFeqqiNlQfM
	 QQy3gSsSGi8pXFZSVVn2qRkSC4Ud3TcY9MtsnjLs2wYzWyDFK9XjOrStaFZCjxa78Yv+6
	 o4Y6kY8zI2Khmm2SjU6J4bBq5p3ToirdWCaCDRUb5v/1+wcYJxpR/qDGhfDQU8hg0GCRJ
	 H/V1Djo6YNITFeSdIzQcERSmt4a85WQtD4w8GCu01ClcuwKubJpS7uzVQcAZlxKPNbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FC7606A6E4
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 20:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0FC7606A6E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f269e335eso159567485a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207326; x=1795812126;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KrVV3AOCGOoPGe2MUIFLejrxfFKgPLjyVQ0ZWShESYk=;
        b=KouDtenEafmdgjGakJM0EQtLOvk6zhMRYRDApwo2mIpWqsPbKU7jBk7xLkAxCIqHy5
         QLGPECw+DOtEYJ9OP74PiBxMx1I/Fs9+PXMiTaID/qaMVRjcOT3MUU4QiMPKvoSRkyJK
         QUCDpQ/G0tc39E5IOMwq/fLErd7clKnd1p1XLjcLCPrU5UvMM32jEHkB/BJGnEgZxbxW
         sb4SNEgE8Am1gX1rS+uFlsAyBW0VdEiRKfOUwH8xaX9tXlQw+OEtt2SyTsO3fSveS+nG
         3GjsJzzpf9syBT4gHH+3zpBIs7KZxfndJNcdudc2Wl9rzL1ZUimDbey+/hCICfmZiYyN
         doKg==
X-Gm-Message-State: APuU4Z8lKqwqUntO5ciMvq67FvTiBd9LuJOf7nApOVvohlz6Sn8uGpND
	o9NaIGsBPJQzeakMUPF+f7w9B+S6orUJfP27dUXknLFz8X7W/7KDDgB2upjyRg==
X-Gm-Gg: AYBFou2MKeCvXOxBxJcwJPQFV3RcvaL3u13ejnUmsyl7kmymR/I9rmBrznQOYUt2Xbw
	msCjj9r52tgl+VHhE05GScaKsNXheOTGSwn6viOlSkSMhhV7cRApu1oPwze0m0CqPJb0BPu2UTd
	tQS485K7fUAyHJDL8EfBalFzaxScJNnCSBi+ODlt1FLfWYiQl9p9yPU2UvDpHE8x0/xvazYWdWa
	4PQW2XRNABU2CQfJzEMGsin0H2ExWAXeg7A5Y5xjr7fOMH1vedUfKFb+otCYZoaw6sSZjmoYM3U
	UuE8g6A08grDpmlhn+gn5FpGaJTaGSgFQt/TsAQG/ZbHujA4Kew9r14X+h72sB8HKUWhIsCvJOz
	q8zjOdL/W3bw7dzD5Cg4M9ZPQbddFyDVzI/I0wPaopJN2TqQ0a8B+5dcsY+jTKAt6s8+Hu4ND7z
	8vMz3Uf7aGdDbwWbpSi5KwutL7v+q9GcKrM7xNZmv1rHfdu4O5GpRFORV1XsTIBv2PN4atBgnyV
	qqYYXLT7fDxgeA9Tgv/dpRX7MuJNv0RWfHyCHJ3N2FQ3XytrawlbdhrBQ7e1oBiPUxngZGYVImK
	Mg74E80TvjgS6AKuxNY3NiM63o7ZnSEwsdbJ503PPdfig6/4Xdsh2oWwdNxAiA9uosEGY5r9tQS
	chFWzTcUBSin2bpht02cvdM8xhplKf8h5Ly/+1LcdImQrRDqJAFrLXRsUoBgRKZ2ZeF3hO230jw
	==
X-Received: by 2002:a05:620a:1711:b0:949:7759:7fb4 with SMTP id af79cd13be357-949ba9e258bmr714400685a.39.1795207326583;
        Fri, 20 Nov 2026 12:42:06 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f1ee7sm273793285a.28.2026.11.20.12.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:06 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf 3/6] libbpf: ringbuf: Handle position counter wrap
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711421.18576.2781507926971358718@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20260614020552.022A11F000E9@smtp.kernel.org>
References: <20260613-bpf-ringbuf-fixes-v1-3-e623481cb724@kernel.org> <20260614020552.022A11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> does the kernel side have a similar
> wrap-around issue in __bpf_ringbuf_reserve()?

Yes. Fixed independently by 6ff5b56a50c5, now in the base.

> [...]

> does __bpf_user_ringbuf_peek() have
> a related wrap-around bug on 32-bit systems?

Yes. Fixed in v3 using native-width subtraction and span validation.
The mixed-width ABI issue remains separate.
