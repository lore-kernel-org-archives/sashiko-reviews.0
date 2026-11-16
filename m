Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866433;
	b=2fiQEFSx8XAfD3lO+x+Uwq2LFYanfoQ4DL6qg0x3pa11hj76wu6bUhd6awXh9bMJG51C
	 wSL0v2tW4Or1huC+UVjTT5adI2yHMK6TjrSfB0k5qF9A01VukUOaLAsc2VG5W257Cqtiu
	 +a6UpKk1pMKwM9qVW3GtZTm6Z2VDKqPQcimPdqsMexCXn3Y3J5825IdVqOYzF0f3kwcnD
	 p3BPl+h9/ysETPOJB48yEr3lAEn0gcOg1m9UnQuToZsaEEFGkr4Ro5Qj6i003rQcWp4WD
	 JHeGdpt5G2i/mjhgPLloklRZW/44Idv/UBod0dkwyeTonOHUJsF68/D+FuG1/N936ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZqVAm41tblC8KUx+ymwmm9M7gFeW83F6GB1B3bf8apc=;
	b=hmB/QkdfWr4YsYNUfQKLjcc+TZV5hqRh81VjRK1JpXT24f3ueQNHW5ZNWav5f6ujQSVA
	 ThBrzRHLLxqpDOdoHl+vpYcyQKsU35lw9TmoWbtB2lbonXzltnzVDPRzYzShdP+VyWt1S
	 cqqFn/Rm3QeSTETes+/k0JwPgGF31tvUVndx8wSczhNKWNb25jd1mEwiPK2hnlVTanOlc
	 F87CdjgnsoHtvCHOBv5AeR9/lZZXh5JgtanxkD2kTGEPaKyB0mIXmGxaS7AeqOrdeENPv
	 JHsFZnJidjQBgPA6b+HnkxbvkTefozIG7hOCm7FDdj131vQTKYYCIf+s42cU56Z+G0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qlAR0Rmj;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1041606A881
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 22:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1041606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qlAR0Rmj
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so48316725e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 14:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794866431; x=1795471231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqVAm41tblC8KUx+ymwmm9M7gFeW83F6GB1B3bf8apc=;
        b=qlAR0Rmjudiz6ebUFDu62j7n/jU+4hiK4EEUwvxelCcMhBkgT13YMgRwHlyy4tM5sp
         iHI3ofOoIds3ULp0qpNLvFSDUEAfqLHf3Rp27MKl6Div7agZn9o9Hnn/xMPKgWe1bTuF
         5b0ho5Bheq8RWTn+0OQ+ILc3m4KqAzCzMkDoQk3JfBjP7NkZecYmmdjM/WJPZVkYOMZy
         fl3YE1F5gxabb9HC48JJwqdlR57fzkWOpK863ttC6CE9ZQrE/TMVytMZpH4AD0lPt6Mh
         dB48rakXBkBmYbcDxhdZrTf22is0de8Bfa1VzBJq5mPaW/811pgNUzDAC5jfwoy6FrBt
         FcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866431; x=1795471231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZqVAm41tblC8KUx+ymwmm9M7gFeW83F6GB1B3bf8apc=;
        b=ai/k2NTEpo1Io0HbyqxQzsEmlGFwxqNKT8lFjiErNkugZ+tIaIa6de/uZDQpFRI/Se
         FhJK5IhtxVUvjLa/1l0pdknz1p2cw0YLBqFrEDlCQMa4fkLun/XlXvBSplH3z9FXtWS8
         oXL/HRzLTbDHxvGhuqFJAM88j9B1xi6J5Gybq6zVNJjxS/FnnqvOe5v0bKtF0MdO0ydL
         3loYWWFV++nyxOJFLLBt1qRyiu/WmP3vcPwODPR+uyxXEuQF0NhhhoGwNLFgxJ0ZYz6n
         3rsfYC2WcR9ITAd+xhSV5IeLLScXPNuABSBF3k3lcPtGc9cqI/BzU8j3Pb3QphBGlDWm
         x9UQ==
X-Gm-Message-State: APuU4Z9LDQ3WQHGfjaVGcL2ysLpBpEqptF07vqxmzLy57ri0/WDiE4q1
	tDMRyKkjyakIL8DTrIvXoOy57Vj0r8YTjeRNnufQIas8/cr/Yh45cPZwA0xW233XVQlQpg==
X-Gm-Gg: AYBFou1R56Auwu6jKwqEESQNRp0QIwpM5iXF3JGi+sXvZAjrSSxDwgxN/TLi8BJ/9vI
	84i4qRNEqon/WHRVWrx3LoDyPS9X1rs/tyOyvgPenW0h14j8MYaNYHA426JYpCNMWk9+LOGvAta
	E4dgPPwypYrKyzuTJUuBj7I0Xykzyhy+29mP1S6pRqhe/gUcgqAj05w/sQ8YS34TFcMhzgT7ZtX
	N0NKIC9/xr+G1Cv/I5cH/6DXBvrReFE8eZ5Wrj9ZPsrksc4X/NhDQa0t9hgP3tXHmPloK07Mc86
	6nRIh5f937r+Dx7q264y0N4RZmP5okoCKjqns7ty12vK33/Fw0+wbwLxRt5EwaaSrkFJNf5X1Gy
	tqVuPzhpw0s6wUAO6l4G9hZTvO60ljG52sm7IhJ5nE/YQfcQnqn5joe8rX+VJHRze3D030mV4tL
	gfBX0hS6qaRTTv0jhNAqnTyQ7CSOiDdeF22aRYKzWYmIFG6ZSzmf/1oB+ws8G3EZ9gv/qoAKVZD
	cigD0/aLim/lJyoMbpnAFZaPFvS+YCJieSzFHMibRzW/RVHmktKbP/TGL06gTONIZdwFjnFzOZu
	OKi42xrLvwUJZAqIhg6dI3T1iOY=
X-Received: by 2002:a05:600c:8b34:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4bb559f7039mr250487985e9.3.1794866431031;
        Mon, 16 Nov 2026 14:00:31 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7813fa23sm25960175e9.2.2026.11.16.14.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:00:30 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 16/16] arm64: dts: qcom: Add Samsung Galaxy XR
Date: Mon, 16 Nov 2026 21:59:55 +0000
Message-ID: <20261116215955.3784340-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-217738@kernel.org>
References: <sashiko-outbox-217738@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 16/11/2026 21:40, sashiko-bot@kernel.org wrote:
> Does chassis-type = "headset" fail dtbs_check validation?

"headset" was added to dt-schema recently:
https://github.com/devicetree-org/dt-schema/commit/bcb597bbb0c988b490fdd6ed08d023d6ddc538b9

Stanislav
