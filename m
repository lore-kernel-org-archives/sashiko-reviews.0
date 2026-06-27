Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB708395AF8
	for <sashiko-reviews@lists.linux.dev>; Sat, 27 Jun 2026 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782571488; cv=none; b=mt1sdC52KGVmkV1RTTSf6e+U6GjDuNCuNmjtfkH5ovDPbyROOKjoK+FRHHdV3TfRCStUcFoHasOyVG2rako/Cxq32JTKj3nZAyBB5ZOyyZKKq4+Nc0i2JN273WZbzIrOOFpsVFBhMANVRY8T0jZ1cvtjB5Nme4Bs2wiP1M939R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782571488; c=relaxed/simple;
	bh=0rZEmBSB6RwYaXks5XbSZYkz0UouvgnUvN+DYo6N+Aw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=k7/8L363J5dV2nVdhdI/NqjQRUk2TRrdAK6oq0LGnn75zELZgcQr0lOArL1mPxw5wjvt5fA1GTQv18qrS09fLH/BKjZSc2rrxlZ57KJc11XVCiO2DnAGlutWYiqNBdCsXWfOiGsJXe4gA99YdS/DoFfxbnokG7emXPTX5rT5HjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M357ATog; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M357ATog"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-69e9b037d82so1629044eaf.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 27 Jun 2026 07:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782571486; x=1783176286; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rZEmBSB6RwYaXks5XbSZYkz0UouvgnUvN+DYo6N+Aw=;
        b=M357ATogYeAQUOGoDQ9GuHk5uMXGmJpXirA3vZ+hnu5Ui4FXlRGXS2LVY8hmoAqzBA
         VV349BWTDEkHCgo7DY46rMoyb12xVL2LmoCgoLFRuAPNlP/G7ogarFBbUI0I/sLkZyPk
         P1/gh04fjvXN0A73JcU7LImOH3RNNyb2fh4G24NdyuNkRzPB28+5Cvfa8sSnds1mmjcR
         O8KAoHNLDMRSKxgz7ellZSx62yx9+gMBWe5i4WtjhSyDYp5GhpeYNOFGpLu/rbe60WlT
         4zIJgMHLyWi63kMmkCFmWqts8HU8RC+mBpwGKDeTV12SYskF33vG1U7N5U7yArYOvBPp
         V3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782571486; x=1783176286;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0rZEmBSB6RwYaXks5XbSZYkz0UouvgnUvN+DYo6N+Aw=;
        b=niaYJd5H8rZrnO0AmCBEftd19UVmHjoTWMNLH3W6DbilcwOxwrLQck2UdCvZDZpMyy
         Cm28/0TmSQYtkzOx0RrQnZ9lU+GpKaltyWadlA9VgrDZbiXYa5K3aI4KY2RfF8o0yrDo
         DJOQcV/4zr+9lHkLOyoyTrgDLxa2O9mrkuVfplp+l+UxtYC8mRkRCsM+F3HtkmJ3fJgW
         5fqP45eKjJ6V2FUp5/3coDfSLb0wdHnKW0Kpu/m0T+GpKSgrPp+nzH2xHdUoF9vXlvl+
         G/iMgpG/mBUunRqnIDITrDFjRIyO3v7DT26hqoIOiQAF3Li63onnQ4yUbteywozbfo7I
         R13w==
X-Gm-Message-State: AOJu0YzE6FBzsemwNrA+iDtdqcqgb+UWqWOe0KNgQx2HZk/4NOJtjdvI
	3tYYfKfmDfI0SA74i8QjYre6qkmHRe4coqqUgB2dlWuFw8gjOhPI9HksJiXUWQ==
X-Gm-Gg: AfdE7cmWVXcAh/7ZTI1jeWkN5c7UDI4voUtec1aipVQtQdaVax/T4mhFEHPxPB67frp
	ufMnrPK5VaR6T5q4UNScuVJ4wzZcbvALYnKxFW4di2AJxRfnRCy+1YJN9AcKNI+Dudum5DukRbr
	I7wo/vJS37PfDw5fv8EOI59Wf3fxonwh7A65dXK1Leipt8TDmVFLoAbdx90TFxrNab57Zur7qip
	P9qOZ/eRF0n1Emmq9Tr2+OWV3iT728ECbigYdB+03sprPvTDIzbzKll4QT3qkRExU+5dAOfmFdd
	JxpjRmoJPDWQaiRBPN12094MEvDQy0rB7AYWqgKi3husWsHwjJoHq2dfIaB2SoGNyCQr+Fz8ppV
	Ddf6ghsyXR+8l0m2hyztZQzt9NE/3Ej1FBG5qp+AtKpFEtV3ouUJFE4oq3xlfae1h6BdlEEa4dr
	lN5yq+UKeEOnYYc9dF3NklX1tmIgAS6IiYLQ7gMvn0ByURd5sCR6IXd4R5AclAxcniuRy8o1qMO
	4OUuPo=
X-Received: by 2002:a05:6820:1b05:b0:6a1:50e9:d57d with SMTP id 006d021491bc7-6a150e9d685mr3382832eaf.58.1782571486270;
        Sat, 27 Jun 2026 07:44:46 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:46::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa29a98fsm4395073a34.0.2026.06.27.07.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 07:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 07:44:44 -0700
Message-Id: <DJJWUQWQ6Y6W.2J1E1SKVHQAPO@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next 5/5] x86/bpf: enable EXECMEM_ROX_CACHE for BPF
 allocations
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc
References: <20260626-execmem-x86-rox-bpf-v0-v1-0-45a0b0ed4fe9@kernel.org>
 <20260626-execmem-x86-rox-bpf-v0-v1-5-45a0b0ed4fe9@kernel.org>
 <20260626185945.2F7BB1F000E9@smtp.kernel.org>
In-Reply-To: <20260626185945.2F7BB1F000E9@smtp.kernel.org>

On Fri Jun 26, 2026 at 11:59 AM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Pages freed from the ROX cache via vfree() are returned to t=
he page allocator with Read-Only permissions, causing kernel panics on subs=
equent allocations.
> - [High] The return value of execmem_restore_rox() is ignored in __execme=
m_cache_free(), potentially leaving cached memory as Non-Executable (NX) an=
d crashing the kernel when BPF programs are executed.

The pre-existing issues sounds real and probably should be addressed
before cleanups in this series? Or altogether?
