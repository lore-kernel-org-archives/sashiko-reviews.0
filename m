Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D594CE68B
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 12:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548130; cv=none; b=g2wDGCDVVTL2nV3qOqv8kTFmjjUnvZc5+0MMoppH0e+zf0WKDHswEvGCbDgB94w9npRafiXFvXN55aVjx04q70YJh+NLYVpnWe2VO8937QGAPkd3FOs3pXxyEgeDlrrOq7Qlts8ioeqlPzKv7GX9qkRyovBkUGXCrZYH+XAAtuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548130; c=relaxed/simple;
	bh=vceZL3VaGhIq5Kh7FR6bjm/0yZMX2sL9Ve9SakQb4Q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZ/4HY7iviOEgXyY94UV5IdpKaMemyIRVdpOofnvJnG7S/e99QtXZJ1yRAwb2l1TWZ3AbzJATBKoWmI0irYUsTXPlPh5V9YiR4JA2kbXQ+pPQ+M9pi9wlCbErykxsz7Ej5d44kXFvJ9Za1/Go/G9Ag2n3idarT1z+X+DBiQtdn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaqpWdgr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaqpWdgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791548114; x=1823084114;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vceZL3VaGhIq5Kh7FR6bjm/0yZMX2sL9Ve9SakQb4Q8=;
  b=UaqpWdgrTJxS4pzvfzg/+XNFVMvLfaecwKVKayq89AK6PKuGL1p29sVI
   +NzvoSZIdSyCSc9+nhxJDAcxb9ixRjlQqQeakIXhSq/PLnlyfTDINLkbK
   +Q13iXegzAXKlG8JuQc4zXkczqwxMkzshPBmb18KVPFZ6+IRRos70cAPF
   W6cIC6RMqOerYVYvQMd/+pnNqy6qGxdWtxfPwxeGH76OAxCNhrwNULcuP
   qa43PKO+8CLhX1ACQP+BHnvdoiIAwcMQ9lkMfTBT7OS562QbY21AQIPV1
   8/uG+G/nEESerZ15c45eWhiiaK7IjzFVg5EOajP+2gAOOADbc+nsI7mNP
   A==;
X-CSE-ConnectionGUID: o3kX6IdBSheOXk2/Q/0Tlw==
X-CSE-MsgGUID: zV50E113QyW5Y47DjEBe2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="353770"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="353770"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:15:13 -0700
X-CSE-ConnectionGUID: EhRb7/94ScigYto//i6wcA==
X-CSE-MsgGUID: JwXNypyHSfaeqLq8N59uvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="237116"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.17]) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:15:11 -0700
Message-ID: <f09ce7f2-b721-469b-9cb3-5127826f7e9a@linux.intel.com>
Date: Fri, 9 Oct 2026 15:15:08 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] usb: xhci-pci: Add TUSB73x0 definitions
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-9-mathias.nyman@linux.intel.com>
 <sashiko-outbox-165196@kernel.org>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <sashiko-outbox-165196@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 13:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] usb: incomplete refactoring of TUSB73x0 PCI ID magic number
> --
> 
> commit 876cce743788b879e20245be68d1112387a5be14
> Author: Fabio Estevam <festevam@gmail.com>
> 
> usb: xhci-pci: Add TUSB73x0 definitions
> 
> This patch introduces definitions for the TUSB73X0 PCI ID, USB_CTRL register
> address, and PWRON_POLARITY. This replaces the hard-coded values in the
> code to improve readability.
> 
>> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
>> index a8889081ae824..c580e0b860118 100644
>> --- a/drivers/usb/host/xhci-pci.c
>> +++ b/drivers/usb/host/xhci-pci.c
> [ ... ]
>> @@ -95,6 +98,8 @@
>>   #define PCI_DEVICE_ID_ASMEDIA_3042_XHCI			0x3042
>>   #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
>>   
>> +#define PCI_DEVICE_ID_TI_TUSB73X0			0x8241
> 
> [Severity: Low]
> Does this code leave an incomplete refactoring of the magic number 0x8241?
> 
> In drivers/usb/host/pci-quirks.c:quirk_usb_handoff_xhci(), the TI TUSB73X0 PCI
> device ID is still hard-coded:
> 
> drivers/usb/host/pci-quirks.c:quirk_usb_handoff_xhci() {
>      ...
>      if ((pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241) ||
>      ...
> }
> 
> Should PCI_DEVICE_ID_TI_TUSB73X0 be placed in a shared header so it can replace
> the hard-coded value in both files?
> 

Sure, dropping this patch for now. It only added some definitions

Thanks
Mathias
