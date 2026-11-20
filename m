Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207357;
	b=C0qetljJ4D8suuviqDUpVYzxCNuqberUq/fsA1JJc2LsKff8RNujpGS80/Otq0frRs1l
	 jymF8hS5SdV1SjmJhFneKke7L54ayd+s32G+o3fLMOvR3taQbUaLqBWksXEVyPDoZZfJD
	 QK2mlVn8usztUfdOwr6oM1YnqGhiisahNmenA453ZOD6FnhB0xgji1mwBRyyu4VnzPSGV
	 6/Ye9kuc7l4Mafkc49hVCYUeVIZghEPgrVOIKGrQILIYqQrIy8o7sjfu3TV8AV543H/xm
	 xCeKwurrrak8s57vqUcJHUU/Jxi6tpO14DgHtUCInN81v2lvhoFezZQkvZzrONAbG+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207357;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=rtb6dKj5LN/FEVm2jhNPaNf/E5DPE0maWn7m8EHNqa0=;
	b=EsRKMBMCpZ3QNuYIfTDgg7SpKgLCUnikUMUAwXlBS16Cb18UbHgVt+R9ot6LwtAO/54c
	 qXeiwuupOkPY3smRrvd8kFW7b0QKsY7gd6zqB++B47kFW4ztiOLGaVUir+d0Cd1DUfqcD
	 bxExsZdzH6hrtGWckbzSVU9PQKYimgtoqaAxXOIE0hM0dEoTr67YVffx98wcjlbdS7qPJ
	 9iESNcLaZ5zCX7+w4CHx4yqtDP1FqSimQacFIpbxAzfWeF4Zl4JAdEBIIFs3FdQ5NYNc9
	 D6omWBVWyGIhgYR3Ehx0IyMhe7gVT0dFxC51HkvZ9/xqbAMt/jOOX0D8sP2IPLfvXCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0164B606A6E8
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 20:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0164B606A6E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f20b304c0so124894385a.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207356; x=1795812156;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtb6dKj5LN/FEVm2jhNPaNf/E5DPE0maWn7m8EHNqa0=;
        b=YwZNe0Bk2W2VkD9JO9pe1cmfgjvgX8oWMbcqHNORyxpgVzafLpIBh7k/7vkr8MWxxv
         2CCR865bPK1L3bIuqdBdX6dUMNAlS20kYEXbfGN3fcnKaoIo8/Pihkso/NlZLs2Am/tU
         HSr3FlXOJYka6chIhvY29PqYlMGZXzlbsk5cmnQ8+MFIaxXsb/GRUz6Ak+llYhjuHxCG
         HNIcYYybwNLt7kFILgotZMrDV+sb0yHRAkTCvct1TY48eqz7XL8qxmDCKbnCbnmT2qSf
         GlTrppCT+qyf65xnKd7fH+xOeKe+j3ePPgEejfqBI65Pe0DV4PuePuwOacqOL+UhGChN
         P0VA==
X-Gm-Message-State: APuU4Z/ZXDaffqhHEryYX9Sjgm2ngRwqJ+B8pG/vcBx6Xqr0rOWD/M7J
	o5duf+vsFsPZK3NQ9M/dTsDEW/EQwzEH1MUD2FUOpcRScjXCm8EBjApI7e+uEA==
X-Gm-Gg: AYBFou0pSHIV1lwcGxd4ojwyEGD6YAMM4bjDXSqBT/+26G5FpxpCXDXBRMfUvPDxK2b
	tae40XIAX1t0cm+9w++3xDuhzf5HL3xOMAX0faoHtsRlUOvWkIi2k56WiSX7wkBmUJoXPd4APU4
	LNR7SUrNrDtPB6LAFv5Fe75fDK4TlWLJbb2PlBmDTMEgDEm15tGPaasmVMwmJ36MClhEVDD+0My
	2NWz/gTM5Gb8hwblvzV6/LloIqzj5nrxZfIIcpx+6Lh7BIHKM9hx5Fj2LZsUop2KQYsP40UR2NQ
	Mjx9rq1MEpBIM4HaB1TiDbLlBPJIHQoUq/dL969jqIyww3nBs0N+eH+RR4OkW5f7zJ4A/iegMY0
	69U5R0p4pv6WI2B70CQMlqNSPli5eLpnk9MClroxOYshyMC/cEkpza+FZF/gY+7uJ8zqVHcNC/1
	9ijRnqtyAORG6BNvyfeIAwnlvn3aWDgKT6RTlrHjiAXn9rBUZhbuHw/6+uWtySgTghTxiwtKITp
	Seq99uYB1g0gZuT0fMd6wFMaRsB6ZBVHizPl+1IQBQkbgSD0HpCserGn5xz0tlnXY+dd8RIoKJl
	jqgbT1R28D7DIGK93C3aq+Q85fQhDPPZr9OLYC5jArqVg5pZFRw03CeX/stQAm7WhUkeRSF1CUt
	1gCfxWsZ7EvpKYEyYWls8PKCGdfbU/MHZRHvcAWxXLx3gSARj8a8Z
X-Received: by 2002:a05:620a:28d5:b0:949:6ece:8aed with SMTP id af79cd13be357-949ba9aa388mr693527485a.36.1795207355972;
        Fri, 20 Nov 2026 12:42:35 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0e35sm35061626d6.20.2026.11.20.12.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:35 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf v2 5/8] bpf: ringbuf: Handle pending position wrap
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711439.18576.6015951285184464138@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20260619004559.4E1531F000E9@smtp.kernel.org>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-5-33fde039ddf3@kernel.org> <20260619004559.4E1531F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Does the use of max() on wrapping unsigned long counters here lead to
> erroneous available data calculations?

Yes. 3f611e9b820e fixes that ordering issue and is now in the base.

The complete-counter-lap case remains unresolved: taking the minimum of
zero and a positive overwrite distance still yields zero. I have not
reproduced it at runtime; it needs a separate overwrite-counter fix.
