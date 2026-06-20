Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289F7285417
	for <sashiko-reviews@lists.linux.dev>; Sat, 20 Jun 2026 07:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781941655; cv=none; b=iKRhnCTxjjIMJI0MIAT0SBssMhyGJjk8YI601Qsu0iP3/SHqfYi7Z7pKNzlckkQE3R675A7jDivCyj4YOWEv0fjTGyZvlCyZaQlRRNmrdBaO0MMvJ/sW9msAvml2/LP/opBQ1pfPRgCCiie1szsOfVk6n4p5nsb1Jze8LUxKgdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781941655; c=relaxed/simple;
	bh=CGaSle0JP4NlvOHxZxH2Ie3emSkFSrdW2uVS1Av9j3U=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=X5Cn+7K5Ob6u2Tbhf14rI6wqndCXUcSMOr64CRBsRVYKh/InMrgjHjNJW1FwxdneyTDMKXdMQEsyaEDVMi4giEStZm07Bn+R5yonswM/2ttShDdkgWX0/75K9p8rEhNh1lenYNQ/Cpa4cFReoJQ9rz3nwuXVckahxGDchcEhZOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=j6B/PtEX; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="j6B/PtEX"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1390f75d8bbso3750057c88.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 20 Jun 2026 00:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1781941653; x=1782546453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:cc:to
         :from:subject:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGaSle0JP4NlvOHxZxH2Ie3emSkFSrdW2uVS1Av9j3U=;
        b=j6B/PtEXHVQYvH2pbYbzpoSY66Gvi0hrgDkVpvcVfMjy3EH4dbYHRGEgwcyBVL+Jz7
         VWg9vnI10rFAQt5rweHyqaSHBlAIYL7AXa7fyl/jtlKO/dPcEoEw+R+MLvADDy4QBLky
         VjQ3wYWQrgo0NEia9+7b07LdHqII0jMI30zvJvzobRTqZjeTZcLgPJXDEz0ZlG+FIykG
         pidhb0gicEpafn3JwHSDFuF8Co5JDWJ7tF/RcKAjarT6J1pjbdoFX47asOfMUMXB2tqD
         Wf9PyHA9qTnY3F5JVF8l2GksEi4KiDQfdgg5CK6TH3dRwrC+RDXEPJqXVwFUoZZnZRKz
         qpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781941653; x=1782546453;
        h=content-transfer-encoding:mime-version:references:in-reply-to:cc:to
         :from:subject:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGaSle0JP4NlvOHxZxH2Ie3emSkFSrdW2uVS1Av9j3U=;
        b=msXHuBldFbQwWeixIQbHvBDXmU/bMYXetLfThIp6QTepHteM8IFAstulYq/bXJFV32
         wEsZGc4DkzYKsTSsXEl8zFrUMkIrB7IQu/PKtAZ46oWbGUM/galgfn/mWrUWhD8OIOtZ
         3EDpDcBC2lzcxsM68W00bjCxcO4qC0N5fWK7tYoTWhWiAvlsANEGnzaFMqBM1/ppYbSv
         UnnxiNI+/u2tEj0lNlzotM0wUbB4eHchIV49lTi02oi9Ml3WN+hojZri9pWO5ZNkwxvJ
         iD/WCMuwXN1zSfc+CUPDFRdAq+KhwzU2vDYja7PhXkTUEREr7lljPMiPSP1loZNIaivw
         8FXA==
X-Gm-Message-State: AOJu0YxdT6wPOBKlChAkcnkxmkMpLDfw4iOe6mcfeGmbUpocX8389PKF
	Ah8edizayMon11etnJMJsiW3ZxLyizDv+5rq4N5apubj+mjQO8wS2F/uebCJOyiy6WqDxVcHNgl
	CxaT9
X-Gm-Gg: AfdE7cmLkVyraypoQ8qcH6S5KUJ6NvyTqoLr7kc1UpCqkZ2JUuhxoQhrhIMLO0HdQC4
	P3Z9PMYB390FpE9+XN2+qAApOKrU7anfFa9eabq/IfvaWppVwdif3YxTgncsQ2Gvn8Wl5UM+hub
	34IVkZqeVnDbNfxc6E+g/suf9v6AjS5Uti92iqAmFzwalvMLVTf7zPDZ1NbttQD1bCIxowgnq4e
	mVo5LZFfL0C7xCAC3J5H/+Eh8Oq/NYFB3aItxvkohqwb/qx1wqmRNQ+iu7LUHuJU3oQho0gI+NT
	lhYtCAFWv2eDnLbubtfT7opJByWIhMyk1XXmn/tVqEiZxsRChRC8vFWgK9Hz+k/IC1aDaw2hrrZ
	50OB2YILAWhqZjSZWG4W3quyQN4a3AEU0sfQquE6Lyd3e2qkwV5shOSD9hdMZ+5mceV4UXFv4I0
	JXinjPGo5ifHwh
X-Received: by 2002:a05:7022:4383:b0:12d:b7e5:a691 with SMTP id a92af1059eb24-139a4eb8b1fmr2876221c88.7.1781941652989;
        Sat, 20 Jun 2026 00:47:32 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add81933sm1826956c88.14.2026.06.20.00.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 00:47:32 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 20 Jun 2026 00:47:31 -0700
Message-Id: <DJDPLHR74OJJ.1H86LMMNB3YMN@nexthop.ai>
Subject: Re: [PATCH] hwmon: (pmbus/xdpe1a2g7b) Add regulator support
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>
Cc: <linux-hwmon@vger.kernel.org>, <linux@roeck-us.net>,
 <ashish.yadav@infineon.com>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260620065358.0FA801F000E9@smtp.kernel.org>
References: <20260619-xdpe1a2g7b-v1-1-428c3847be0d@nexthop.ai>
	<20260620065358.0FA801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 20 Jun 2026 06:53:57 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Critical]
> This is a pre-existing issue, but does enabling regulator support here expose
> attached hardware to destructive voltages when operating in nvidia195mv VID
> mode?
>
> The core PMBus framework translates microvolts into raw register encodings via
> pmbus_data2reg_vid(), but it currently hardcodes the VR11 VID calculation
> formula and completely ignores the vrm_version parameter configured by the
> driver.

Good catch! Confirmed: pmbus_data2reg_vid() ignores vrm_version while its
read counterpart pmbus_reg2data_vid() already switches on it, so a non-VR11
driver that exposes a regulator -- or any hwmon vout_command setter -- will
write VR11-encoded values into the chip. For an nvidia195mv part this turns
a 200 mV request into VID 0xB2, which the chip interprets as 1080 mV.

I'll send the core fix as a separate prerequisite patch (mirroring
pmbus_reg2data_vid() so writes round-trip with reads) and respin this
series on top of it.

Thanks,
Abdurrahman
