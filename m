Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483606;
	b=PTmWiYgQ7U83eVqmosZ5IqnUV3BPnrDqwIraXXiBw+2Ij/axCimq36Vl9rWY8iT9p3Df
	 y+Ub73XVTzu3BKA81ZAtId87HZyhx6IIZvuF8coORzs5lJ7mVuPHOfbyDACj7LDJrYgjB
	 68PtHgZLMoeL4aNV+eJzs/h40ZJMn64mwYgv2OU7FpH9Tv3apXg4Z4B73fksBicsEmT4q
	 DH/g3MLDNWkdD0jVFrTA6vF/9J86h8Ff0S8hbzhkN4fWbnurQDnjClXcM13mAAa5NChJX
	 0H9ANugQ2FXMXLnoJHdAkNvhrsGLR19N8YMfubgD49G1stlbglv61ZmiWAeNQMmgJgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=VmudOlYzKuyF8nJTc3mFuzpqRfR0BM4YC36DH+65758=;
	b=Y6PeQ3VlLvaRmK34lI+FbXEuEmWnn/bJ2SOWKyJ6sz3vLVmPYq+dzuJLpq135r4HWcOO
	 sk7VDctkbi2q+G4cwdzSVNQQAcv/awog1vk1RJ/+erLRcqZylySgzBbGOvhjmTLl8AOAV
	 8EsRgJA0lj54owq/DFxP9d1FJUQDKBAnCfN5nf9ViJGvdA4LevboV3mk5KByEX7QxjpcR
	 Kzsx3f1qIDmmdhfGA1/8gApYycQyCw5relg/LcSOS+cf9O1qImy21+nsUfxEjri67X8TP
	 lPCAcsjVrryc6bPAUb0WVwEdGDroVE78R6q4NAv9ch21pftsHEvPzhmZeEl0tfyK0kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJkPHk9S;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD92606A89C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 11:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACD92606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJkPHk9S
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-372bdb942dbso5335033eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 03:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483605; x=1795088405; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VmudOlYzKuyF8nJTc3mFuzpqRfR0BM4YC36DH+65758=;
        b=rJkPHk9SAR3xzqRJM4I9jNo6OndXqQN+xIe7j81YTBytUMDXYPsuLnPAYAsineDAPn
         EZzhu9rvH+Q/O0kLjbwxX0GnH+tk9hSpWWwHVswUkS+Iaq7mC3Tnk+IUAytC3sHKeuah
         J7tNvA7fXiYHsVK02cs4PAix7DxI8AmDENFahAXQ4t+Lz2lCcVQDMfW/b/WXIZR0SbG2
         o3EoWLs67yfu1NNPFpttCh1dGqfVtXCGdssa/Im7QshrpNHZ4LPilRz3jAO8zoUH/PtB
         8iBuxv6AKhbhtlF8r9W94qcKpjzV1g9cVtjRBrzW8eX+Q3mBHLt3tCw0xWZo4Bx9vqPf
         Kptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483605; x=1795088405;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmudOlYzKuyF8nJTc3mFuzpqRfR0BM4YC36DH+65758=;
        b=aKIrwx92/PHpbENqT6/rsLePYss8PrlDb68Z2ZC/LKyoCLd2gBAh+tc54Mj1uHr43n
         1uAv0rZ+uitnozoPHfREy3KVN4pdSwfu5Xh4B6xw1Jk0bRcN/Sdoc1fMbSOTNKM1ZAax
         ATEYyh/IfQz0hBG6yK7M0acolTEtoTTu2C12+ZJoNzM9zuKYmLJJ/wkuDUoKv+yh+5l5
         Pf2BrB6aTXi4KX2SebQCgvQFXu9GVLHIvOp0e0U9zH0YB3Th4uV4UZYTVus3DtIM2zhA
         INZc434ONXzp4aBj1SKmwth4Q2Ax6lA0C3oAQIZTtoHNvyvn7Mc5+2F2GI036wXyQtJ2
         IR5g==
X-Gm-Message-State: APuU4Z99cOSBtDJfXEcMPJ1DKHfWaaqT5c+77gHHM5LCLyxHNo91JuWy
	oY/63+cMxDpqmla81x79dD0JzsnvgMuFx7WXDyr86brGJQg+Qqc5R/rrAL0AJu93Hro=
X-Gm-Gg: AYBFou2xMUFIsgo3ple4UIFR7DHVsftQue37dVJuKaG/9ITRkr005tBHGm2Y/W5W9xB
	oKcssg1HsVGumwmVyibBN7jnOI+Y9pQTZC4n2zdzBpZzm6Z/hJGrf9aGqpAnex9QpVEfccNsUYX
	JNZG1GRAMgA5ZmyDLdPATSQe96xKUm/PLJ2A62R8BK9H58ewRPbxl35xCxAG5135r0LqimUvLhV
	Ujg0XhuWDdruoCOX8ftmR8SuZw0GhhiDuFSP+o/uvNAqPRREmhA64s8TArfvZG4eU6dmAmPhxXR
	R5QKwRA4Sg0ETh+7kO3lvjF6Q2qzmhG3sSeG1lMpUkvYokP/hNvd10aZ77VjkCa9JuOmJUPkQFo
	r62NHiN3QVeGX0g6SGWqr0s6lObasMuN+qL0p2Frx+TMy3QVvaZKRzU4LO32IILGIA8hsKn/7u4
	kyZgBCSRWMzQoFeKP4+/6tk1ac0PucObYsNZA2Y118HMt1ADrQkP7APdsVzDLMbtg0NvPWMLysu
	eT+0VgSNy1FptbzsJ0blPYUn+agEO753dWuyOKOYxn/dyi9SW1x4V/LcsUYaG2VN/j6FR//aWq/
	keOZp7CocJUfC0w/B8+2EhKwA5PaEmrUpXOSFxX7mQ==
X-Received: by 2002:a05:7301:508e:b0:36a:1434:c691 with SMTP id 5a478bee46e88-37686171ea2mr4966182eec.14.1794483604509;
        Thu, 12 Nov 2026 03:40:04 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm50310345eec.23.2026.11.12.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:04 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Thu, 12 Nov 2026 20:40:04 +0900
Message-ID: <20261112114004.182-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <sashiko-outbox-195550@kernel.org>
References: <20261103135057.1682-1-26rote@gmail.com> <20261103135057.1682-4-26rote@gmail.com> <sashiko-outbox-195550@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 03 Nov 2026 15:05:12 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Can enabling mode-switch on the Kaanapali USB controller trigger a race
> between dwc3_qcom_mux_set() and system suspend/resume in
> drivers/usb/dwc3/dwc3-qcom.c?
[...]

Yes. This is the same race as in your review of patch 2, and the fix
is in the driver. In v3 the mux callback no longer resumes the glue.
From the start of a runtime or system suspend until the core has
resumed, it only records the state. dwc3_qcom_resume() applies it
before the core resumes. v3 also compares with the clock selected in
QSCRATCH instead of a cached value, so a selection lost with QSCRATCH
in system suspend is restored on resume.

As Krzysztof asked, the DTS patch is now sent on its own:
https://lore.kernel.org/all/20261112113921.1143-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
