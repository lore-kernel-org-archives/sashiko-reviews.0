Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010071.outbound.protection.outlook.com [52.101.46.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A708382F08
	for <sashiko-reviews@lists.linux.dev>; Sun,  7 Jun 2026 23:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780874029; cv=fail; b=Wdmg98kPFA/9Ped21Cvn+a3aEqtTFUCspZNFaQtCrmVMEB4YqKC6UqaysCeXoOLiym0RuYWlF2/wGCcVBJ9Omnnclat2dXTnXDVgEoHMvKrtik/ZbxEg4j3Quxk1Ogycq57vRjj4QzrFUHx5SkTkZQn2TQdDYobbOw7GQl1DvWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780874029; c=relaxed/simple;
	bh=gGGr94GM3WvlepsQmHvdjxzGhPaM44xjRjo2oF9F0gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q8E543PcuPvlu2t+U/kV7WTk5ekxjVaDsUrcwjMQTN8BTBxL2j1oloFkCmRj5Lwf4Xftk1ZrnOkf8xR2X5Ym7H4yZTOubGS+YylCyguG9n+RVjMC3Rkz6I1w7cMaUt+uWXTu6vaokRNGBznL8WbYkWsxA8Yb/0mvpGkJDcTPT1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R9YJbakT; arc=fail smtp.client-ip=52.101.46.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R9YJbakT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hsfg+ljbgNY3FH+Sk6yQPJLcTFxd8yR7PuTWet8poci2NjRtBC+CPRPGwFz/LIWAVuTz5KCMnvX7R3OkIrDI7uSbXSsLKBWDsW7i0Pp27QHvXmkPb6v9AOSfiCQ6HJsRQkKUkCqJBbdiqoR54MVjuNXbVoIRJJDbHlSH3GDcQYR565usR0iLbuTW5pS4Bl2/MUxxiNKPlIPO5wDNSPlti6VgaDdUSAyr1Z+Jn7gowJfvt+eUu8ysEacdYh0JGR5HjjMfFSy1lR06Co5HzlIqbrDAgeMt0CCavNCfcpFw09711R8n4cVt+DsxonkquGgKitdSszzPwR9cvsVrcBw2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sv00gUoNs9PAbMnKoP3YuSk+jhec/RNUOekUbChQBgk=;
 b=MaNdSsWh25tCDIG9ugTcCPflzvTw5mnWVjjqd1jUddQXWqBEJTEG8Lb/VNPMGoU09BIxpAuOa6kdCY14lu8R+1NpIPXkZ8bFj0w0CIQsLrj8HXYScu0GJQak8vVIf70UfFDYtYTjnst0dU7/EBXcFUyUmLGO699mYpTpQqMmX2yFR8vBljRVwPXnI9PGhkz2gPy0W0KS46c2OS/wGhS0bIF7XLPprt7r+z0OdpDDMJX9BIYJ9/DbGMh+Mb4M8CWZK7nk+wSJdFyPkleVjx7aLjH79ZF1X9cKal520gf8NL3zRcaeeLzNnkhgwUN4zWHNwBtqPR4rDP2wb2AmDZUjUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sv00gUoNs9PAbMnKoP3YuSk+jhec/RNUOekUbChQBgk=;
 b=R9YJbakTT9QNVgzxxaZwjB6qbYCiVydHfukU10sDsvOSN410EiL8pDEHC9AOm+xsUnya/kNZSO0f7VAa7npVM1/zw7A8TevCMIIGP9CP4eVD4YFA00DaFt7lVvlhj9sn8gEtveNaQGzoAY83ij4yZH/EvuwNQU/a9H0B9EhLP6k=
Received: from MN0P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::35)
 by DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Sun, 7 Jun 2026
 23:13:42 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:52b:cafe::a0) by MN0P223CA0018.outlook.office365.com
 (2603:10b6:208:52b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.12 via Frontend Transport; Sun, 7
 Jun 2026 23:13:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Sun, 7 Jun 2026 23:13:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 7 Jun
 2026 18:13:41 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 7 Jun
 2026 18:13:41 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sun, 7 Jun 2026 18:13:41 -0500
Message-ID: <5bf9faa6-59a3-eb26-b9b0-b063e74d8964@amd.com>
Date: Sun, 7 Jun 2026 16:13:41 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix amdxdna_client lifetime race during
 device removal
Content-Language: en-US
To: <sashiko-reviews@lists.linux.dev>
CC: <dri-devel@lists.freedesktop.org>
References: <20260605175351.2496830-1-lizhi.hou@amd.com>
 <20260605181834.D03571F00899@smtp.kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20260605181834.D03571F00899@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|DM6PR12MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: d12dc4d9-61b3-4d84-0741-08dec4ea6a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|18002099003|6133799003|5023799004|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	yQ7gLfTHLD+7USk1niV2Etuh+3yxefNZAOF1vxgE+FdVjzJv4gNBNhZtUQB8+cz3794G4LQwKCCl9RG7Vpa6sYjKrKbIRLrxOle126/dFJ6baYihQ0gZK0UpG9bkTnmZOjVQoQGY2qEQGntcdTtzA423jItxJpO4urdxF8P7m7EuPRgAu4haXPXMJDC0nR9xw1xAtnT1XBRu2RiKt8HJfmi76yuB7JMsjRX1xCMxXTGJlNvHGEST0Z2EfvhCy0xtIwdGUUVnsWIR6hp9OAIOxCY3BDpVhxgmWqdIm4JgfdV5QfN8Q8AojojSTSSwb6+kO0HTdkzEI5BzfEqoXslvNGyij5Zm+Nrw6v2PkVvyGXvFr+YRp+R7hphB0lEHDt8nV10SaypPC4JSfuBhSlztqAZK5681SXqTE+9Bdj68Ps2rbvbL8S0E58G9iIKxjOB/ugGReZF3iu1GfW8J+tTk/hSpi2yhudbfajENVAP+W7Y360HB5Jr0dJ2ewDEcfMH9HH+c3XkRqD/HMJbdnMTzRhFsqjzo493lKlxVE8hZgjgmeGAiIFDgbO1wGlxKOsTKPlHbj/wvJndLqqQTNultgbaFdra1CR3uvAPwvmkcrAdcOeuNzlvPl7ptQ5Z57ayAzRQRUTjnnjAaTE3IznWmXdzeTatdXo2UYdRf2zNNBsrqraYLNKTrCnz0zIThzlm1Y7wkfo96SktKTA4/FIbyM/4JW5puQASBrUyaCuzIjlQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(6133799003)(5023799004)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JzFSiNmVmdTTBmKeRdf1lEayHzjlOiuOxT0ohiISJehNX/rF8xu4JE0dnRyFM0jgtEJldqUcSMkMNfLpGcQnaEeHJGJ7m9MSpO4PJcUorliKVIge71ce/tvG/TkeL6PXbTZYHLm+/I9CQ4+MHaGa9rqwJBTpsmwOPORVFaVQw3prPashJeTS+tpdmN6HjczFigdwbLuIbh9GHD4YykEjdtSJxMP/UaAB+j+2GOqlpezKwLCm0Unla59HoHshwyCbnD7Y41ywWFpqbnH1/aJviiNXIBskS0QvXepmVf2fjobB8Pea94mOJUIY8EFBnJiWHt+83iVkT2nmbN779vPVKStbixtzUVN2K/JF8dFQMeqUibEO2HkpGFAN3xBGDftNqkbtjZ3SwadRuZ2vbhUouIIgPN9ldL5xxnSUITXSUtXWFaofpvtI2ktsewbbSetA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 23:13:41.9092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d12dc4d9-61b3-4d84-0741-08dec4ea6a63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330


On 6/5/26 11:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>
> New issues:
> - [High] Dropping dev_lock during amdxdna_remove() list iteration causes a Use-After-Free if a file is closed concurrently.
> - [High] Deferring IOMMU SVA unbind to amdxdna_drm_close() causes a NULL pointer dereference in the IOMMU core.

Agreed. I will provide a simpler fix in v2 patch.

Lizhi

>
> Pre-existing issues:
> - [High] Deferred GEM object freeing accesses destroyed IOMMU domain structures, causing a Use-After-Free.
> - [High] Deferred GEM object freeing calls flush_workqueue() on a destroyed workqueue pointer.
> --
>
> commit ec7bb08ec6d7a0837cd580d24a3f76e7ed06a6c6
> Author: Lizhi Hou <lizhi.hou@amd.com>
>
> accel/amdxdna: Fix amdxdna_client lifetime race during device removal
>
> This patch changes the client cleanup logic during device removal.
> It decouples hardware teardown from client cleanup to avoid a use-after-free
> if amdxdna_drm_close() is called concurrently with amdxdna_remove().
>
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index c677293c1ae7f..3016db07c7cad 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -167,18 +167,12 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
>>   {
>>   	struct amdxdna_client *client = filp->driver_priv;
>>   	struct amdxdna_dev *xdna = to_xdna_dev(ddev);
>> -	int idx;
>>   
>>   	XDNA_DBG(xdna, "closing pid %d", client->pid);
>>   
>> -	if (!drm_dev_enter(&xdna->ddev, &idx))
>> -		return;
>> -
>>   	mutex_lock(&xdna->dev_lock);
>>   	amdxdna_client_cleanup(client);
> [Severity: High]
> Since amdxdna_client_cleanup() is now deferred until file close, could this
> trigger a NULL pointer dereference during SVA teardown?
>
> When a device is removed, the PCI subsystem unlinks it from its IOMMU group.
> Later, when this file is closed, amdxdna_sva_fini() calls
> iommu_sva_unbind_device().
>
> Inside the IOMMU core, iommu_detach_device_pasid() dereferences the group
> pointer:
>
> 	struct iommu_group *group = dev->iommu_group;
>
> 	mutex_lock(&group->mutex);
>
> If the device was already removed, dev->iommu_group would be NULL, causing a
> crash. Does the SVA unbind need to happen earlier during device removal?
>
>>   	mutex_unlock(&xdna->dev_lock);
>> -
>> -	drm_dev_exit(idx);
>>   }
>>   
>> [ ... ]
>> @@ -436,14 +430,8 @@ static void amdxdna_remove(struct pci_dev *pdev)
>>   	amdxdna_sysfs_fini(xdna);
>>   
>>   	mutex_lock(&xdna->dev_lock);
>> -	client = list_first_entry_or_null(&xdna->client_list,
>> -					  struct amdxdna_client, node);
>> -	while (client) {
>> -		amdxdna_client_cleanup(client);
>> -
>> -		client = list_first_entry_or_null(&xdna->client_list,
>> -						  struct amdxdna_client, node);
>> -	}
>> +	list_for_each_entry(client, &xdna->client_list, node)
> [Severity: High]
> Does this list_for_each_entry() loop have a use-after-free risk if the lock
> is dropped internally?
>
> The loop calls amdxdna_hwctx_remove_all(), which invokes aie2_hwctx_fini().
> Inside aie2_hwctx_fini(), xdna->dev_lock is temporarily dropped to wait for
> hardware idle:
>
> 	mutex_unlock(&xdna->dev_lock);
>
> Since this patch removes the drm_dev_enter() safeguard from
> amdxdna_drm_close(), a concurrent file close can acquire dev_lock while it
> is dropped here. The concurrent close would remove the client from the list
> via list_del() and free the client structure.
>
> When the lock is re-acquired and list_for_each_entry() attempts to fetch the
> next element, won't it dereference the freed client->node.next pointer?
>
>> +		amdxdna_hwctx_remove_all(client);
>>   
>>   	xdna->dev_info->ops->fini(xdna);
>>   	mutex_unlock(&xdna->dev_lock);
> [Severity: High]
> This is a pre-existing issue, but does this function leave xdna->domain
> dangling, leading to a use-after-free on deferred file close?
>
> During device removal, amdxdna_remove() calls amdxdna_iommu_fini(), which
> frees the domain but leaves the pointer intact:
>
> 	iommu_domain_free(xdna->domain);
>
> If the application keeps the file descriptor open, drm_gem_object_put() will
> later invoke amdxdna_gem_obj_free() during cleanup. This calls
> amdxdna_dma_unmap_bo():
>
> 	if (amdxdna_iova_on(xdna)) {
> 		size = iova_align(&xdna->iovad, abo->mem.size);
> 		iommu_unmap(xdna->domain, abo->mem.dma_addr, size);
>
> Since xdna->domain is not NULL, amdxdna_iova_on() returns true, and
> iommu_unmap() is called on the freed domain. Should the domain pointer
> be set to NULL after being freed?
>
>
> [Severity: High]
> This is a pre-existing issue, but could deferred GEM cleanup trigger a
> use-after-free on the notifier workqueue?
>
> Earlier in amdxdna_remove(), destroy_workqueue(xdna->notifier_wq) frees the
> workqueue structure.
>
> When a process retains an open file descriptor past device removal, the DRM
> core defers GEM cleanup to the eventual file close. When
> drm_gem_object_put() calls amdxdna_gem_obj_free(), it unconditionally does:
>
> 	flush_workqueue(xdna->notifier_wq);
>
> Since the workqueue was already destroyed and freed, won't this result in
> a use-after-free crash?
>
